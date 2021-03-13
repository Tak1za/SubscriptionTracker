class Subscription {
  String serviceName;
  int subscriptionCost;
  String paymentDate;
  String subscriptionPeriod;

  Subscription(
      {this.serviceName,
      this.subscriptionCost,
      String paymentDate,
      this.subscriptionPeriod = "Monthly"})
      : paymentDate = paymentDate ?? DateTime.now().toString();

  Map<String, dynamic> toMap() {
    return {
      "service": serviceName,
      "cost": subscriptionCost,
      "paymentDate": paymentDate,
      "period": subscriptionPeriod,
    };
  }

  factory Subscription.fromMap(Map<String, dynamic> map) => new Subscription(
        serviceName: map["service"],
        subscriptionCost: map["cost"],
        paymentDate: map["paymentDate"],
        subscriptionPeriod: map["period"],
      );
}
