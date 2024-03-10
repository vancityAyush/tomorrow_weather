import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomorrow_weather/gen/colors.gen.dart';
import 'package:tomorrow_weather/src/weather/presentation/bloc/weather_bloc.dart';
import 'package:tomorrow_weather/src/weather/presentation/views/weather_screen.dart';

import 'core/init_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing Dependencies
  await initApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<WeatherBloc>()),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('hi', 'IN'),
        ],
        path: 'assets/locales',
        fallbackLocale: const Locale('en', 'US'),
        child: ScreenUtilInit(
            designSize: const Size(375, 832),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                title: 'app_name'.tr(),
                home: const WeatherScreen(),
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  primaryColor: AppColors.primary,
                  colorScheme: const ColorScheme.light(
                    background: AppColors.backgroundLight,
                  ),
                  fontFamily: "Poppins",
                  useMaterial3: true,
                ),
              );
            }),
      ),
    );
  }
}
