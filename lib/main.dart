import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomorrow_weather/src/weather/presentation/bloc/weather_bloc.dart';
import 'package:tomorrow_weather/src/weather/presentation/views/weather_screen.dart';

import 'core/init_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: MaterialApp(
        title: 'Tomorrow Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const WeatherScreen(),
      ),
    );
  }
}
