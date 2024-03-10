import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_listner.dart';

class ConnectivityHelper {
  static ConnectivityHelper? _instance;

  static ConnectivityHelper get instance =>
      _instance ??= ConnectivityHelper._();

  final List<ConnectivityListener> _listeners = [];

  final List<ConnectivityResult> _hasInternetOptions = [
    ConnectivityResult.mobile,
    ConnectivityResult.wifi,
    ConnectivityResult.ethernet,
  ];

  ConnectivityHelper._();

  bool _hasInternet = false;

  bool get hasInternet => _hasInternet;

  init() async {
    Connectivity connectivity = Connectivity();
    ConnectivityResult result = await connectivity.checkConnectivity();
    _hasInternet = _hasInternetOptions.contains(result);
    Connectivity().onConnectivityChanged.listen((event) {
      bool hasInternet = _hasInternetOptions.contains(event);
      if (hasInternet != _hasInternet) {
        _hasInternet = hasInternet;
        _notifyListeners();
      }
    });
  }

  _notifyListeners() {
    for (var element in _listeners) {
      element.onNetworkChanged(_hasInternet);
    }
  }

  void addListener(ConnectivityListener listener) {
    _listeners.add(listener);
  }

  void removeListener(ConnectivityListener listener) {
    _listeners.remove(listener);
  }
}
