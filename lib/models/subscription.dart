class Subscription {
  String serviceName;
  int subscriptionCost;
  String paymentDate;
  String subscriptionPeriod;
  String nextPaymentDate;
  String imagePath;

  Subscription({
    this.serviceName,
    this.subscriptionCost,
    String paymentDate,
    this.subscriptionPeriod = "Monthly",
    this.nextPaymentDate,
    this.imagePath,
  }) : paymentDate = paymentDate ?? DateTime.now().toString();

  Map<String, dynamic> toMap() {
    return {
      "service": serviceName,
      "cost": subscriptionCost,
      "paymentDate": paymentDate,
      "period": subscriptionPeriod,
      "nextPaymentDate": nextPaymentDate,
      "imagePath": imagePath,
    };
  }

  factory Subscription.fromMap(Map<String, dynamic> map) => new Subscription(
        serviceName: map["service"],
        subscriptionCost: map["cost"],
        paymentDate: map["paymentDate"],
        subscriptionPeriod: map["period"],
        nextPaymentDate: map["nextPaymentDate"],
        imagePath: map["imagePath"],
      );
}
