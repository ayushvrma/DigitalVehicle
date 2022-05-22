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
          const Text(
            'Vehicle Registration',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 27),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: rc_num,
            decoration: const InputDecoration(
              icon: Icon(Icons.menu_book),
              border: UnderlineInputBorder(),
              hintText: 'Enter rc number',
            ),
          ),
          const SizedBox(height: 10),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            initialValue: 'four',
            icon: const Icon(Icons.directions_car),
            labelText: 'Vehicle-Type',
            items: _items,
            onChanged: (val) => veh_type = val,
            onSaved: (val) => print(val),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: veh_num,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter vehicle number',
                icon: Icon(Icons.numbers)),
          ),
          const SizedBox(height: 10),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.blue.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Colors.blue.withOpacity(0.12);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () async {
                var map = new Map<String, dynamic>();
                map['rc_num'] = rc_num.text;
                map['veh_type'] = veh_type.toString();
                map['veh_num'] = veh_num.text;
                Uri uri = Uri.parse('http://127.0.0.1:5000/vehicle');
                // http://127.0.0.1:5000
                http.Response response = await http.post(
                  uri,
                  body: map,
                );
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
