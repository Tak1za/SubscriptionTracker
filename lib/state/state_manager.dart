import 'package:flutter/cupertino.dart';
import 'package:subscriber/models/subscription.dart';

class StateManager extends ChangeNotifier {
  List<Subscription> _allSubscriptions = [];
  
  List<Subscription> get allSubscriptions => _allSubscriptions;

  void addSubscription(Subscription newSubscription) {
    _allSubscriptions.add(newSubscription);
    notifyListeners();
  }
}