import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tomorrow_weather/core/utils/helpers/time_utils.dart';
import 'package:tomorrow_weather/core/utils/widget_helpers/text_extension.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';
import 'package:tomorrow_weather/gen/locale_keys.g.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather_forecast.dart';
import 'package:tomorrow_weather/src/weather/presentation/widgets/forecast_card.dart';
import 'package:tomorrow_weather/src/weather/presentation/widgets/weather_card.dart';

class WeatherView extends StatelessWidget {
  final Weather weather;
  final WeatherForecast forecast;
  final bool isEnabled;
  final ValueNotifier<ForecastType> forecastType =
      ValueNotifier(ForecastType.hourly);
  WeatherView(
      {super.key,
      required this.weather,
      required this.forecast,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          height: 1.sh,
          child: Column(
            children: [
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocaleKeys.days_today.heading1(),
                  Text(
                    DateTime.now().formatDateTime(),
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              20.verticalSpace,
              WeatherCard(weather, isEnabled: isEnabled),
              20.verticalSpace,
              isEnabled
                  ? buildForecastTypes()
                  : Shimmer.fromColors(
                      enabled: !isEnabled,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: SizedBox.fromSize(
                        size: Size(1.sw, 50.h),
                      ),
                    ),
              10.verticalSpace,
              ValueListenableBuilder(
                valueListenable: forecastType,
                builder: (context, value, child) {
                  return ForecastCard(
                    forecast,
                    type: value,
                    isEnabled: isEnabled,
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForecastTypes() => ValueListenableBuilder(
      valueListenable: forecastType,
      builder: (context, value, child) {
        return Row(
          children: [
            buildForecastButton(
              isSelected: value == ForecastType.hourly,
              type: ForecastType.hourly,
            ),
            10.horizontalSpace,
            buildForecastButton(
              isSelected: value == ForecastType.daily,
              type: ForecastType.daily,
            ),
          ],
        );
      });

  TextButton buildForecastButton(
      {required bool isSelected, required ForecastType type}) {
    return TextButton(
      onPressed: () => forecastType.value = type,
      child: Text(
        type == ForecastType.hourly
            ? LocaleKeys.hourly.tr()
            : LocaleKeys.daily.tr(),
        style: AppTextStyles.heading1.copyWith(
          color: isSelected ? AppColors.primary : AppColors.textGrey,
        ),
      ),
    );
  }
}
