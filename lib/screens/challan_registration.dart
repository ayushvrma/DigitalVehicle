import 'package:flutter/material.dart';
import 'Widget/challanContainer.dart';
import 'package:select_form_field/select_form_field.dart';

class VehicleRegistration extends StatefulWidget {
  const VehicleRegistration({Key? key}) : super(key: key);

  @override
  State<VehicleRegistration> createState() => _VehicleRegistrationState();
}

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

class _VehicleRegistrationState extends State<VehicleRegistration> {
  Widget _vehicleinfo() {
    return Stack(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            icon: Icon(Icons.numbers),
            labelText: 'Vehicle Number',
            labelStyle: TextStyle(
                color: Color.fromRGBO(173, 183, 192, 1),
                fontWeight: FontWeight.bold),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned(
                height: MediaQuery.of(context).size.height * 0.50,
                child: const VehicleRegContainer()),
            SingleChildScrollView(
                child: Column(children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: height * .55),
                      SelectFormField(
                        type: SelectFormFieldType.dropdown, // or can be dialog
                        initialValue: 'four',
                        icon: Icon(Icons.directions_car_filled),
                        labelText: 'Vehicle-Type',
                        items: _items,
                        onChanged: (val) => print(val),
                        onSaved: (val) => print(val),
                      ),
                      _vehicleinfo(),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.numbers),
                          labelText: 'RC Number',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(173, 183, 192, 1),
                              fontWeight: FontWeight.bold),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(173, 183, 192, 1)),
                          ),
                        ),
                      ),
                    ],
                  ))
            ]))
          ],
        ),
      ),
    );
  }
}
