import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._();

  static LocationService? _instance;

  static LocationService get instance => _instance ??= LocationService._();

  // For current Location
  Position? _position;
  bool get hasPermission =>
      _permission == LocationPermission.always ||
      _permission == LocationPermission.whileInUse;

  LocationPermission _permission = LocationPermission.denied;

  Position dummyPosition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.timestamp(),
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  Position get currentLocation => _position ?? dummyPosition;

  init() async {
    _permission = await Geolocator.checkPermission();
    if (hasPermission) {
      await LocationService.instance.getCurrentOrLastKnownPosition();
    } else if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }
  }

  Future<void> getCurrentOrLastKnownPosition() async {
    _position = dummyPosition;
    _position = await Geolocator.getCurrentPosition();
  }

  // Reverse Geocoding Function
  Future<String> getCityAndState(
      {required double lat, required double long}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placemark = placemarks[0];
    String city = "";
    if (placemark.locality != null) {
      city = placemark.locality ?? "";
    }
    String state = placemark.administrativeArea ?? "";
    if (city.length > 9) {
      city = "${city.substring(0, 8).trim()}...";
    }
    if (state.length > 9) {
      state = "${state.substring(0, 8).trim()}...";
    }
    return "$city,\n$state";
  }
}
