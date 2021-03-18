import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:subscriber/models/subscription.dart';

class SubscriptionPeriod extends StatefulWidget {
  final String selectedSubscriptionPeriod;
  final Subscription subscription;

  SubscriptionPeriod({
    Key key,
    this.selectedSubscriptionPeriod,
    @required this.subscription,
  }) : super(key: key);

  @override
  _SubscriptionPeriodState createState() => _SubscriptionPeriodState();
}

class _SubscriptionPeriodState extends State<SubscriptionPeriod> {
  final List<String> _subscriptionPeriods = <String>[
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly",
  ];
  String _selectedSubscriptionPeriod;

  @override
  void initState() {
    _selectedSubscriptionPeriod = widget.selectedSubscriptionPeriod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white30,
            ),
            padding: EdgeInsets.all(0.0),
            constraints: BoxConstraints(),
            onPressed: () => _selectSubscriptionPeriodPicker(context),
          ),
          SizedBox(width: 25.0),
          Expanded(
            child: GestureDetector(
              onTap: () => _selectSubscriptionPeriodPicker(context),
              child: Container(
                height: 50.0,
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: Text(
                  _selectedSubscriptionPeriod,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectSubscriptionPeriodPicker(BuildContext context) async {
    showMaterialScrollPicker(
      context: context,
      title: "Subscription Period",
      items: _subscriptionPeriods,
      selectedItem: widget.selectedSubscriptionPeriod,
      onChanged: (value) => setState(() {
        _selectedSubscriptionPeriod = value;
        widget.subscription.subscriptionPeriod = _selectedSubscriptionPeriod;
      }),
    );
  }
}
