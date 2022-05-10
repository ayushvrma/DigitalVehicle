import 'package:flutter/material.dart';
import 'Widget/challanContainer.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await
import 'dart:io'; // for http headers

final List<Map<String, dynamic>> _items = [
  {
    'value': 'two',
    'label': 'Two-Wheeler',
    'icon': Icon(Icons.two_wheeler),
  },
  {
    'value': 'three',
    'label': 'Three-Wheeler',
    'icon': Icon(Icons.bike_scooter),
  },
  {
    'value': 'four',
    'label': 'Four-Wheeler',
    'icon': Icon(Icons.directions_car),
  },
];

class ChalanRegistration extends StatefulWidget {
  const ChalanRegistration({Key? key}) : super(key: key);

  @override
  State<ChalanRegistration> createState() => _ChalanRegistrationState();
}

class _ChalanRegistrationState extends State<ChalanRegistration> {
  final rc_num = TextEditingController();
  dynamic veh_type;
  final veh_num = TextEditingController();
  final amt = TextEditingController();
  final chalan_type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          TextField(
            controller: rc_num,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter rc number',
            ),
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            initialValue: 'four',
            icon: const Icon(Icons.directions_car),
            labelText: 'Vehicle-Type',
            items: _items,
            onChanged: (val) => veh_type = val,
            onSaved: (val) => print(val),
          ),
          TextField(
            controller: veh_num,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter vehicle number',
            ),
          ),
          TextField(
            controller: chalan_type,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter Chalan Type',
            ),
          ),
          TextField(
            controller: amt,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Enter Amount',
            ),
          ),
        ],
      ),
    );
  }
}
