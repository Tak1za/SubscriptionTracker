import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscriber/state/state_manager.dart';
import 'package:subscriber/widgets/all_subscriptions/subscription_card.dart';

class AllSubscriptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Consumer<StateManager>(
          builder: (context, stateManager, _) => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: stateManager.allSubscriptions.length,
            itemBuilder: (BuildContext context, int index) {
              return SubscriptionCard(
                subscription: stateManager.allSubscriptions[index].serviceName,
              );
            },
          ),
        ),
      ),
    );
  }
}
