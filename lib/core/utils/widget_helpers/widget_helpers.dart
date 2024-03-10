import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tomorrow_weather/gen/locale_keys.g.dart';

showNoInternetSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(LocaleKeys.no_internet.tr()),
    ),
  );
}
