import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomorrow_weather/core/utils/widget_helpers/text_extension.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';
import 'package:tomorrow_weather/gen/locale_keys.g.dart';
import 'package:tomorrow_weather/src/weather/presentation/bloc/weather_bloc.dart';

class SearchDialog extends AlertDialog {
  final TextEditingController _textEditingController = TextEditingController();
  SearchDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WeatherBloc>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: Colors.white,
      title: LocaleKeys.search_hint.primary(
        fontSize: 20.sp,
      ),
      content: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          labelText: LocaleKeys.search_city.tr(),
          labelStyle: const TextStyle(
            color: AppColors.black,
          ),
          hintText: "Bangalore",
          hintStyle: const TextStyle(
            color: AppColors.textGrey,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: LocaleKeys.cancel.tr().body(),
        ),
        TextButton(
          onPressed: () {
            if (_textEditingController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: LocaleKeys.search_error.tr().text(
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                  backgroundColor: AppColors.primary,
                ),
              );
              return;
            }
            bloc.add(
              FetchCityWeatherEvent(
                cityName: _textEditingController.text,
              ),
            );
            Navigator.pop(context);
          },
          child: LocaleKeys.search.tr().text(
                style: const TextStyle(
                  color: AppColors.primary,
                ),
              ),
        ),
      ],
    );
  }
}
