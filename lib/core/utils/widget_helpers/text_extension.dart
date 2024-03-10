import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';

extension AppText on String {
  String get string => this;

  Widget heading1() {
    return Text(
      this.tr(),
      style: AppTextStyles.heading1,
    );
  }

  Widget text({required TextStyle style}) {
    return Text(
      this.tr(),
      style: style,
    );
  }

  Widget body({double? fontSize, Color? color}) {
    return Text(this.tr(),
        style: AppTextStyles.body.copyWith(fontSize: fontSize, color: color));
  }

  Widget primary({double? fontSize}) {
    return Text(
      this.tr(),
      style: AppTextStyles.primary.copyWith(fontSize: fontSize),
    );
  }

  Widget secondary({double? fontSize}) {
    return Text(
      this.tr(),
      style: AppTextStyles.secondary.copyWith(fontSize: fontSize),
    );
  }
}

class AppTextStyles {
  static TextStyle get heading1 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
      );

  static TextStyle get body => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textGrey,
      );

  static TextStyle get primary => TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      );

  static TextStyle get secondary => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.secondary,
      );
}
