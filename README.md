Tomorrow Weather
Tomorrow Weather is a Flutter-based weather application that uses the Tomorrow.io weather APIs to provide weather forecasts. This application is compatible with both Android and iOS platforms.

Features
Current weather conditions
Hourly and weekly forecasts
Location-based weather updates
Configuration
Before you can run the application, you need to configure the API key.

Open the file lib/core/utils/constants.dart.
Replace the kApiKey constant with your Tomorrow.io API key:
Running the Project
To run this project, you need to have Flutter and Dart installed on your system. If you haven't installed them yet, you can follow the instructions on the Flutter website.

## Configuration

Before you can run the application, you need to configure the API key.

1. Open the file [lib/core/utils/constants.dart](lib/core/utils/constants.dart).
2. Locate the `kApiKey` constant.
3. Replace the `kApiKey` constant with your Tomorrow.io API key.

Please ensure that you do not commit your API key to a public repository.

## Code Generation

This project uses `build_runner` and `easy_localization` for code generation. To generate the necessary code, run the following commands:

1. For `build_runner`, run:
   ```bash
   flutter pub run build_runner watch --delete-conflicting-outputs
   ```
2. For `easy_localization`, run:
   ```bash
   flutter pub run easy_localization:generate --source-dir ./assets/locales -f keys -O lib/gen -o locale_keys.g.dart
   ```

Please ensure to run these commands every time you make changes to the files that need code generation.

Once you have Flutter and Dart set up, you can run the project using the following steps:

1. Clone the repository to your local machine.
2. Navigate to the project directory in your terminal.
3. Run `flutter pub get` to fetch the project dependencies.
4. Start your emulator or connect your device with USB debugging enabled.
5. Run `flutter run` to start the application.
   Contributing
   Contributions are welcome! Please read our contributing guidelines to get started.

License
This project is licensed under the terms of the MIT license. See the LICENSE file for details.
