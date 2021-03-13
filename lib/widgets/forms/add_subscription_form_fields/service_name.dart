import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:subscriber/models/subscription.dart';

class ServiceName extends StatefulWidget {
  final Subscription subscription;
  final String serviceName;

  ServiceName(
      {Key key, @required this.subscription, this.serviceName})
      : super(key: key);

  @override
  _ServiceNameState createState() => _ServiceNameState();
}

class _ServiceNameState extends State<ServiceName> {
  final List<String> _serviceNames = <String>[
    "Amazon Prime",
    "Google One",
    "Disney+ Hotstar",
    "Netflix",
    "Zee5",
    "Xbox",
  ];
  String _selectedService;

  @override
  void initState() {
    _selectedService = widget.serviceName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: GestureDetector(
        onTap: () => _servicePicker(context),
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
            _selectedService,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _servicePicker(BuildContext context) async {
    showMaterialScrollPicker(
      context: context,
      title: "Services",
      items: _serviceNames,
      selectedItem: widget.serviceName,
      onChanged: (value) => setState(() {
        _selectedService = value;
        widget.subscription.serviceName = _selectedService;
      }),
    );
  }
}
