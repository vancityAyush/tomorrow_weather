import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tomorrow_weather/core/utils/helpers/time_utils.dart';
import 'package:tomorrow_weather/core/utils/widget_helpers/text_extension.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/daily_weather.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather_forecast.dart';

enum ForecastType { hourly, daily }

class ForecastCard extends StatelessWidget {
  final WeatherForecast forecast;
  final ForecastType type;
  final bool isEnabled;
  const ForecastCard(this.forecast,
      {super.key, this.type = ForecastType.daily, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return !isEnabled
        ? Shimmer.fromColors(
            enabled: !isEnabled,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: buildView(),
          )
        : buildView();
  }

  Container buildView() {
    return Container(
      height: 180.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: type == ForecastType.daily
            ? forecast.daily.length
            : forecast.hourly.length,
        itemBuilder: (context, index) {
          if (type == ForecastType.daily) {
            return dailyForecast(forecast.daily[index]);
          } else {
            return hourlyForecast(forecast.hourly[index]);
          }
        },
      ),
    );
  }

  Column dailyForecast(DailyWeather daily) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          daily.time.formatDayOfWeek(),
          style: AppTextStyles.body.copyWith(
            fontSize: 16.sp,
          ),
        ),
        2.verticalSpace,
        LottieBuilder.asset(
          daily.icon,
          width: 80.w,
          height: 80.h,
        ),
        2.verticalSpace,
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: '${daily.temperatureMax.toInt()}°',
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                color: AppColors.text2,
              ),
            ),
            TextSpan(
              text: ' | ',
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                color: AppColors.text2,
              ),
            ),
            TextSpan(
              text: '${daily.temperatureMin.toInt()}°',
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                color: AppColors.textGrey,
              ),
            ),
          ]),
        )
      ],
    );
  }

  Column hourlyForecast(WeatherForecastModel hourly) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          hourly.date.formatTimeToHour(),
          style: AppTextStyles.body.copyWith(
            fontSize: 16.sp,
          ),
        ),
        2.verticalSpace,
        LottieBuilder.asset(
          hourly.icon,
          width: 80.w,
          height: 80.h,
        ),
        2.verticalSpace,
        Text(
          '${hourly.temperature.toInt()}°',
          style: AppTextStyles.body.copyWith(
            fontSize: 16.sp,
            color: AppColors.text2,
          ),
        )
      ],
    );
  }
}
