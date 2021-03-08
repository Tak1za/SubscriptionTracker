import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:intl/intl.dart';

class AddSubscription extends StatefulWidget {
  @override
  _AddSubscriptionState createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  DateTime selectedDate = DateTime.now();
  String selectedSubscriptionPeriod = "Monthly";
  List<String> subscriptionPeriods = <String>[
    "Daily",
    "Alternate Day",
    "Weekly",
    "Monthly",
    "Half Yearly",
    "Annually",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: <Widget>[
                Container(
                    child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Add Subscription',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 2.0
                                )
                              ),
                              hintText: 'Enter service name',
                              hintStyle: TextStyle(
                                color: Colors.white30,
                                fontSize: 20.0,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageIcon(
                                AssetImage("assets/images/rupee.png"),
                                color: Colors.white30,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color: Colors.white30,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                            color: Colors.black87,
                                            width: 2.0
                                        )
                                    ),
                                    hintText: 'Enter cost',
                                    hintStyle: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  child: Text(
                                    'Start Date',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                DateFormat.yMMMMd().format(selectedDate),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () => _selectSubscriptionPeriodPicker(context),
                                  child: Text(
                                    'Pick Subscription Period',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                selectedSubscriptionPeriod,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      )),
                ))
              ],
            ),
          ),
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectSubscriptionPeriodPicker(BuildContext context) async {
    showMaterialScrollPicker(
      context: context,
      title: "Subscription Period",
      items: subscriptionPeriods,
      selectedItem: selectedSubscriptionPeriod,
      onChanged: (value) => setState(() => selectedSubscriptionPeriod = value),
    );
  }
}
