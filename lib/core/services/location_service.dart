import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tomorrow_weather/core/utils/helpers/string_utils.dart';

class LocationService {
  LocationService._();

  static LocationService? _instance;

  static LocationService get instance => _instance ??= LocationService._();

  // For current Location
  final BehaviorSubject<Position> _currentLocationController =
      BehaviorSubject<Position>();
  Position get currentLocation => _currentLocationController.value;

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

  Position get currentOrLastKnownPosition {
    if (_positionStreamSubscription == null ||
        _positionStreamSubscription!.isPaused) {
      startUpdatingLocation();
    }
    if (_currentLocationController.hasValue) {
      return _currentLocationController.value;
    } else {
      getCurrentOrLastKnownPosition();
      return dummyPosition;
    }
  }

  Future<void> getCurrentOrLastKnownPosition() async {
    Position? lastKnownPosition = await Geolocator.getLastKnownPosition();
    if (lastKnownPosition != null) {
      _currentLocationController.add(lastKnownPosition);
    } else {
      _currentLocationController.add(dummyPosition);
    }
    Geolocator.getCurrentPosition()
        .then((value) => {_currentLocationController.add(value)});
  }

  // For GPS Stream
  Stream<ServiceStatus> get gpsStatus => Geolocator.getServiceStatusStream();

  // TODO-Critical : Stop the stream subscription in Beta release
  StreamSubscription<Position>? _positionStreamSubscription;
  startUpdatingLocation() {
    try {
      _positionStreamSubscription =
          Geolocator.getPositionStream().listen((Position position) {
        print('position: $position');
        _currentLocationController.add(position);
      });
    } catch (e) {
      // Handle exceptions
      print("Error: $e");
    }
  }

  Future<void> stopUpdatingLocation() async {
    await _positionStreamSubscription?.cancel();
  }

  // TODO: Confirm with shek and remove logic from here and move it to the respective screen - compass_widget.dart
  late StreamSubscription<Position> locationStreamSubscription;

  void startLocationSubscription(
      Function(String location) onLocationChange) async {
    await startUpdatingLocation();
    double latitude = 0;
    double longitude = 0;
    locationStreamSubscription = _currentLocationController.listen(
      (position) async {
        if (position.latitude.toInt() != latitude.toInt() ||
            position.longitude.toInt() != longitude.toInt()) {
          String location = await LocationService.getCityAndState(position);
          onLocationChange(location);
        }
        latitude = position.latitude;
        longitude = position.longitude;
      },
    );
  }

  void stopLocationSubscription() {
    locationStreamSubscription.cancel();
  }

  // Reverse Geocoding Function
  static Future<String> getCityAndState(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String city = "";
    if (placemark.subLocality.isNotNullAndEmpty()) {
      city = placemark.subLocality!;
    } else if (placemark.locality.isNotNullAndEmpty()) {
      city = placemark.locality!;
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
