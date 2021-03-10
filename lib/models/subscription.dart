class Subscription {
  String serviceName;
  int subscriptionCost;
  DateTime paymentDate;
  String subscriptionPeriod;

  Subscription({this.serviceName, this.subscriptionCost, DateTime paymentDate, this.subscriptionPeriod = "Monthly"}) : paymentDate = paymentDate ?? DateTime.now();
}

enum SubscriptionPeriod {
  Daily,
  Alternate,
  Weekly,
  Monthly,
  Biannual,
  Annually
}