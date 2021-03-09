import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';

class SubscriptionPeriod extends StatefulWidget {
  String _selectedPeriod;
  List<String> _subscriptionPeriods;

  SubscriptionPeriod(String selectedPeriod, List<String> subscriptionPeriods) {
    this._selectedPeriod = selectedPeriod;
    this._subscriptionPeriods = subscriptionPeriods;
  }

  @override
  _SubscriptionPeriodState createState() => _SubscriptionPeriodState();
}

class _SubscriptionPeriodState extends State<SubscriptionPeriod> {
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
            child: Container(
              height: 50.0,
              padding: EdgeInsets.only(left: 20.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white30,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
              child: GestureDetector(
                child: Text(
                  widget._selectedPeriod,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () => _selectSubscriptionPeriodPicker(context),
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
      items: widget._subscriptionPeriods,
      selectedItem: widget._selectedPeriod,
      onChanged: (value) => setState(() => widget._selectedPeriod = value),
    );
  }
}
