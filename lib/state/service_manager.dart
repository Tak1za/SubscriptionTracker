import 'package:flutter/cupertino.dart';

class ServiceManager extends ChangeNotifier {
  List<String> _allServices = <String>[
    "Amazon Prime",
    "Google One",
    "Disney+ Hotstar",
    "Netflix",
    "Zee5",
    "Xbox",
  ];

  List<String> get allServices => _allServices;

  markPicked(String serviceName) {
    _allServices.removeWhere((element) => element == serviceName);
    notifyListeners();
  }
}