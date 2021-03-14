import 'package:flutter/cupertino.dart';
import 'package:subscriber/models/service.dart';

class ServiceManager extends ChangeNotifier {
  Map<String, Service> _allServicesMap = {
    "Amazon Prime": new Service(name: "Amazon Prime", imagePath: "assets/images/AmazonPrime.jpg"),
    "Google": new Service(name: "Google", imagePath: "assets/images/Google.jpg"),
    "Disney+ Hotstar": new Service(name: "Disney+ Hotstar", imagePath: "assets/images/DisneyHotstar.jpg"),
    "Zee5": new Service(name: "Zee5", imagePath: "assets/images/Zee5.jpg"),
    "Netflix": new Service(name: "Netflix", imagePath: "assets/images/Netflix.png"),
    "Xbox": new Service(name: "Xbox", imagePath: "assets/images/Xbox.png"),
    "Spotify": new Service(name: "Spotify", imagePath: "assets/images/Spotify.jpg"),
  };

  Map<String, Service> get allServices => _allServicesMap;

  markPicked(String serviceName) {
    _allServicesMap.remove(serviceName);
    notifyListeners();
  }
}