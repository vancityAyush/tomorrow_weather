import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tomorrow_weather/core/utils/widget_helpers/text_extension.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final bool isEnabled;
  const WeatherCard(
    this.weather, {
    super.key,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return !isEnabled
        ? Shimmer.fromColors(
            enabled: !isEnabled,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: _buildView(),
          )
        : _buildView();
  }

  Card _buildView() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.textGrey,
                ),
                10.horizontalSpace,
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 200.w),
                  child: Text(
                    weather.address,
                    style: AppTextStyles.heading1,
                  ),
                )
              ],
            ),
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LottieBuilder.asset(
                  weather.iconPath,
                  width: 150.w,
                  height: 150.h,
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTemperature(weather.temperature.toStringAsFixed(1)),
                    "weather.${weather.main}".primary(
                      fontSize: 14.sp,
                    ),
                    1.verticalSpace,
                    buildWeatherData(
                      title: "feels_like".tr(),
                      value: "${weather.feelsLike}°C",
                    ),
                    buildWeatherData(
                      title: "humidity".tr(),
                      value: "${weather.humidity}%",
                    ),
                    buildWeatherData(
                      title: "wind_speed".tr(),
                      value: "${weather.windSpeed} m/s",
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  RichText buildWeatherData({required String title, required String value}) {
    return RichText(
      text: TextSpan(
        text: title + ": ",
        style: AppTextStyles.body.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: value,
            style: AppTextStyles.body.copyWith(
              fontSize: 12.sp,
              color: AppColors.textGrey2,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Row buildTemperature(String temperature) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temperature,
          style: AppTextStyles.primary,
        ),
        Text(
          '°',
          style: AppTextStyles.secondary.copyWith(
            fontFeatures: [const FontFeature.superscripts()],
          ),
        ),
        "C".primary(fontSize: 20.sp),
      ],
    );
  }
}
