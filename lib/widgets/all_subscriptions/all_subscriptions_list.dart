import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriber/state/subscription_manager.dart';
import 'package:subscriber/widgets/all_subscriptions/all_subscriptions_list_item.dart';
import 'package:subscriber/widgets/start_adding.dart';

class AllSubscriptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionManager>(
      builder: (context, subscriptionManager, _) => Container(
        child: FutureBuilder(
          future: subscriptionManager.getAllSubscriptions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (subscriptionManager.allSubscriptions.length == 0) {
                return StartAdding();
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: subscriptionManager.allSubscriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return AllSubscriptionsListItem(
                    subscription:
                        subscriptionManager.allSubscriptions[index],
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
