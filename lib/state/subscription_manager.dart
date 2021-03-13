import 'package:flutter/cupertino.dart';
import 'package:subscriber/database/database.dart';
import 'package:subscriber/models/subscription.dart';

class SubscriptionManager extends ChangeNotifier {
  List<Subscription> _allSubscriptions = [];

  Future<List<Subscription>> getAllSubscriptions() async {
    if(_allSubscriptions.length <= 0) {
      _allSubscriptions = await DBProvider.db.getAllSubscriptions();
    }
    return _allSubscriptions;
  }

  List<Subscription> get allSubscriptions => _allSubscriptions;

  Future<void> addSubscription(Subscription newSubscription) async {
    await DBProvider.db.newSubscription(newSubscription);
    _allSubscriptions.add(newSubscription);
    notifyListeners();
  }
}