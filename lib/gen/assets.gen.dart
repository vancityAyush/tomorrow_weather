/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Raleway-Black.ttf
  String get ralewayBlack => 'assets/fonts/Raleway-Black.ttf';

  /// File path: assets/fonts/Raleway-BlackItalic.ttf
  String get ralewayBlackItalic => 'assets/fonts/Raleway-BlackItalic.ttf';

  /// File path: assets/fonts/Raleway-Bold.ttf
  String get ralewayBold => 'assets/fonts/Raleway-Bold.ttf';

  /// File path: assets/fonts/Raleway-BoldItalic.ttf
  String get ralewayBoldItalic => 'assets/fonts/Raleway-BoldItalic.ttf';

  /// File path: assets/fonts/Raleway-ExtraBold.ttf
  String get ralewayExtraBold => 'assets/fonts/Raleway-ExtraBold.ttf';

  /// File path: assets/fonts/Raleway-ExtraBoldItalic.ttf
  String get ralewayExtraBoldItalic =>
      'assets/fonts/Raleway-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/Raleway-ExtraLight.ttf
  String get ralewayExtraLight => 'assets/fonts/Raleway-ExtraLight.ttf';

  /// File path: assets/fonts/Raleway-ExtraLightItalic.ttf
  String get ralewayExtraLightItalic =>
      'assets/fonts/Raleway-ExtraLightItalic.ttf';

  /// File path: assets/fonts/Raleway-Italic.ttf
  String get ralewayItalic => 'assets/fonts/Raleway-Italic.ttf';

  /// File path: assets/fonts/Raleway-Light.ttf
  String get ralewayLight => 'assets/fonts/Raleway-Light.ttf';

  /// File path: assets/fonts/Raleway-LightItalic.ttf
  String get ralewayLightItalic => 'assets/fonts/Raleway-LightItalic.ttf';

  /// File path: assets/fonts/Raleway-Medium.ttf
  String get ralewayMedium => 'assets/fonts/Raleway-Medium.ttf';

  /// File path: assets/fonts/Raleway-MediumItalic.ttf
  String get ralewayMediumItalic => 'assets/fonts/Raleway-MediumItalic.ttf';

  /// File path: assets/fonts/Raleway-Regular.ttf
  String get ralewayRegular => 'assets/fonts/Raleway-Regular.ttf';

  /// File path: assets/fonts/Raleway-SemiBold.ttf
  String get ralewaySemiBold => 'assets/fonts/Raleway-SemiBold.ttf';

  /// File path: assets/fonts/Raleway-SemiBoldItalic.ttf
  String get ralewaySemiBoldItalic => 'assets/fonts/Raleway-SemiBoldItalic.ttf';

  /// File path: assets/fonts/Raleway-Thin.ttf
  String get ralewayThin => 'assets/fonts/Raleway-Thin.ttf';

  /// File path: assets/fonts/Raleway-ThinItalic.ttf
  String get ralewayThinItalic => 'assets/fonts/Raleway-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        ralewayBlack,
        ralewayBlackItalic,
        ralewayBold,
        ralewayBoldItalic,
        ralewayExtraBold,
        ralewayExtraBoldItalic,
        ralewayExtraLight,
        ralewayExtraLightItalic,
        ralewayItalic,
        ralewayLight,
        ralewayLightItalic,
        ralewayMedium,
        ralewayMediumItalic,
        ralewayRegular,
        ralewaySemiBold,
        ralewaySemiBoldItalic,
        ralewayThin,
        ralewayThinItalic
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Cloud-background.png
  AssetGenImage get cloudBackground =>
      const AssetGenImage('assets/images/Cloud-background.png');

  /// File path: assets/images/clear.png
  AssetGenImage get clear => const AssetGenImage('assets/images/clear.png');

  /// File path: assets/images/cloudy.png
  AssetGenImage get cloudy => const AssetGenImage('assets/images/cloudy.png');

  /// File path: assets/images/fog.png
  AssetGenImage get fog => const AssetGenImage('assets/images/fog.png');

  /// File path: assets/images/light_freezing_rain.png
  AssetGenImage get lightFreezingRain =>
      const AssetGenImage('assets/images/light_freezing_rain.png');

  /// File path: assets/images/light_rain.png
  AssetGenImage get lightRain =>
      const AssetGenImage('assets/images/light_rain.png');

  /// File path: assets/images/mostly_clear.png
  AssetGenImage get mostlyClear =>
      const AssetGenImage('assets/images/mostly_clear.png');

  /// File path: assets/images/mostly_cloudy.png
  AssetGenImage get mostlyCloudy =>
      const AssetGenImage('assets/images/mostly_cloudy.png');

  /// File path: assets/images/partly_cloudy.png
  AssetGenImage get partlyCloudy =>
      const AssetGenImage('assets/images/partly_cloudy.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        cloudBackground,
        clear,
        cloudy,
        fog,
        lightFreezingRain,
        lightRain,
        mostlyClear,
        mostlyCloudy,
        partlyCloudy
      ];
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en-US.json
  String get enUS => 'assets/locales/en-US.json';

  /// File path: assets/locales/hi-IN.json
  String get hiIN => 'assets/locales/hi-IN.json';

  /// List of all assets
  List<String> get values => [enUS, hiIN];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
