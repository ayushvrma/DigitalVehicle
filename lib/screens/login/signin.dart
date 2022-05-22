// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:digital_vehicle/screens/Widget/singinContainer.dart';
import 'signup.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:http/http.dart' as http; // for making HTTP calls
import 'package:digital_vehicle/screens/vehicle/vehicle_registration.dart';

final List<Map<String, dynamic>> _items = [
  {'value': 'civilian', 'label': 'Civilian', 'icon': const Icon(Icons.man)},
  {
    'value': 'police',
    'label': 'Police',
    'icon': const Icon(Icons.local_police_rounded),
  },
];

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  dynamic user_type;
  final user_id = TextEditingController();
  final password = TextEditingController();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 20, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeWidget() {
    return Stack(
      children: [
        SelectFormField(
          type: SelectFormFieldType.dropdown, // or can be dialog
          initialValue: 'civilian',
          icon: const Icon(Icons.person),
          labelText: 'User-Type',
          items: _items,
          onChanged: (val) => user_type = val,
          onSaved: (val) => print(val),
        ),
      ],
    );
  }

  Widget _usernameWidget() {
    return Stack(
      children: [
        TextField(
          controller: user_id,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Email',
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

  Widget _passwordWidget() {
    return Stack(
      children: [
        TextField(
          controller: password,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Password',
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

  Widget _submitButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () async {
          var map = new Map<String, dynamic>();
          map['user_id'] = user_id.text;
          map['user_pass'] = password.text;
          map['user_type'] = user_type.toString();
          Uri uri = Uri.parse('http://127.0.0.1:5000/login');
          // http://127.0.0.1:5000
          http.Response response = await http.post(
            uri,
            body: map,
          );
          if (response.statusCode == 200) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          }
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            'Sign in',
            style: TextStyle(
                color: Color.fromRGBO(76, 81, 93, 1),
                fontSize: 25,
                fontWeight: FontWeight.w500,
                height: 1.6),
          ),
          SizedBox.fromSize(
            size: const Size.square(70.0), // button width and height
            child: const ClipOval(
              child: Material(
                color: Color.fromRGBO(76, 81, 93, 1),
                child: Icon(Icons.arrow_forward,
                    color: Colors.white), // button color
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpPage())),
            child: const Text(
              'Register',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
          ),
        ],
      ),
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
                child: const SigninContainer()),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: height * .55),
                        _usernameWidget(),
                        const SizedBox(height: 20),
                        _passwordWidget(),
                        const SizedBox(height: 30),
                        _submitButton(),
                        SizedBox(height: height * .050),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(top: 60, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
