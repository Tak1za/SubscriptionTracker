import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriber/state/subscription_manager.dart';
import 'package:subscriber/widgets/all_subscriptions/subscription_card.dart';

class AllSubscriptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionManager>(
      builder: (context, subscriptionManager, _) => Container(
        child: FutureBuilder(
          future: subscriptionManager.getAllSubscriptions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: subscriptionManager.allSubscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubscriptionCard(
                    subscription:
                    subscriptionManager.allSubscriptions[index].serviceName,
                  );
                },
              );
            } else {
              return Center(child: Text("In Progress"));
            }
          },
        ),
      ),
    );
  }
}
