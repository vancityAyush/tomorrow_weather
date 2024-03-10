import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tomorrow_weather/core/services/location_service.dart';
import 'package:tomorrow_weather/core/utils/connectivity/connectivity_listner.dart';
import 'package:tomorrow_weather/core/utils/widget_helpers/widget_helpers.dart';
import 'package:tomorrow_weather/gen/assets.gen.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather_forecast.dart';
import 'package:tomorrow_weather/src/weather/presentation/views/weather_view.dart';
import 'package:tomorrow_weather/src/weather/presentation/widgets/search_dialog.dart';

import '../../../../core/utils/connectivity/connectivity_helper.dart';
import '../../../../gen/locale_keys.g.dart';
import '../bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}
// This class extends the state of the WeatherScreen and implements the ConnectivityListener interface.
class _WeatherScreenState extends State<WeatherScreen> implements ConnectivityListener {

  // This controller is used to manage the text in the city name input field.
  final TextEditingController cityNameController = TextEditingController();

  // This is an instance of the LocationService, used to get the current location of the device.
  final LocationService locationService = LocationService.instance;

  // This controller is used to manage the refresh functionality of the screen.
  final RefreshController refreshController = RefreshController();

  // This timer is used to periodically call the API to fetch the latest weather data.
  Timer? _apiTimer;

  // This boolean is used to track whether the device has an active internet connection.
  bool hasInternet = true;

  // This function fetches the weather data for the current location.
  // If the location permission is not granted, it triggers a NoPermissionEvent.
  void fetchWeather() {
    if (!locationService.hasPermission) {
      context.read<WeatherBloc>().add(const NoPermissionEvent());
      return;
    }
    final Position currentLocation = locationService.currentLocation;
    context.read<WeatherBloc>().add(FetchLocationWeatherEvent(
        lat: currentLocation.latitude.toString(),
        long: currentLocation.longitude.toString()));
  }

  // This function updates the weather data on the screen.
  // It triggers an UpdateWeatherEvent with the new weather data.
  void updateWeather(WeatherLoaded state) {
    context.read<WeatherBloc>().add(
          UpdateWeatherEvent(
            query: state.query,
            forecast: state.forecast,
          ),
        );
  }

  // This is the initialization function of the class.
  // It adds a listener to the ConnectivityHelper to monitor internet connectivity.
  // If the device has an internet connection, it fetches the weather data.
  // If not, it triggers a NoInternetEvent.
  @override
  void initState() {
    super.initState();
    ConnectivityHelper.instance.addListener(this);

    if (ConnectivityHelper.instance.hasInternet) {
      fetchWeather();
    } else {
      context.read<WeatherBloc>().add(const NoInternetEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is! WeatherLoaded && _apiTimer != null) {
          _apiTimer!.cancel();
        }
        if (state is WeatherErrorWithData) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is WeatherError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is WeatherLoaded) {
          if (_apiTimer != null) _apiTimer!.cancel();
          _apiTimer = Timer.periodic(
            const Duration(minutes: 5),
            (timer) {
              updateWeather(state);
            },
          );
          refreshController.refreshCompleted();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SmartRefresher(
            enablePullDown: state is WeatherLoaded,
            controller: refreshController,
            onRefresh: () async {
              if (!hasInternet) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("No internet"),
                  ),
                );
                refreshController.refreshCompleted();
                return;
              }
              fetchWeather();
              refreshController.refreshCompleted();
            },
            onLoading: () async {
              refreshController.loadComplete();
            },
            child: state is WeatherInitial || state is FetchingWeather
                ? WeatherView(
                    weather: Weather.empty(),
                    forecast: WeatherForecast.empty(),
                    isEnabled: false,
                  )
                : state is WeatherLoaded
                    ? WeatherView(
                        weather: state.weather,
                        forecast: state.forecast,
                      )
                    : state is NoInternet
                        ? SizedBox(
                            width: 1.sw,
                            height: 1.sh,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  Assets.lottie.noInternet.path,
                                  width: 200,
                                  height: 200,
                                ),
                                Text(LocaleKeys.no_internet.tr()),
                              ],
                            ),
                          )
                        : state is NoPermission
                            ? Center(
                                child: Text(
                                  LocaleKeys.no_location_permission.tr(),
                                ),
                              )
                            : const SizedBox(),
          ),
          floatingActionButton: state is WeatherLoaded
              ? FloatingActionButton(
                  onPressed: () async {
                    if (!hasInternet) {
                      showNoInternetSnackBar(context);
                      return;
                    }
                    await showDialog(
                        context: context, builder: (context) => SearchDialog());
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: AppColors.primary,
                )
              : FloatingActionButton(
                  onPressed: () async {
                    fetchWeather();
                  },
                  child: const Icon(
                    Icons.refresh,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: AppColors.primary,
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    ConnectivityHelper.instance.addListener(this);
    super.dispose();
  }

  @override
  onNetworkChanged(bool hasInternet) {
    this.hasInternet = hasInternet;
    if (hasInternet) {
      fetchWeather();
    } else {
      showNoInternetSnackBar(context);
    }
  }
}
