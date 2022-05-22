// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:digital_vehicle/screens/Widget/signupContainer.dart';
import 'package:select_form_field/select_form_field.dart';
import 'signin.dart';
import 'package:http/http.dart' as http; // for making HTTP calls
import 'dart:convert'; // for converting JSON
import 'dart:async'; // for async/await
import 'dart:io'; // for http headers
import 'signin.dart';

final List<Map<String, dynamic>> _items = [
  {'value': 'civilian', 'label': 'Civilian', 'icon': const Icon(Icons.man)},
  {
    'value': 'police',
    'label': 'Police',
    'icon': const Icon(Icons.local_police_rounded),
  },
];

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final user_id = TextEditingController();
  dynamic user_type;
  final password = TextEditingController();
  final email = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final dob = TextEditingController();

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
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            // hintText: 'Enter your full name',
            icon: Icon(Icons.numbers),
            labelText: 'user_id',
            labelStyle: const TextStyle(
                color: Color.fromRGBO(226, 222, 211, 1),
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(226, 222, 211, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstWidget() {
    return Stack(
      children: [
        TextField(
          controller: first_name,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            // hintText: 'Enter your full name',
            icon: Icon(Icons.abc),
            labelText: 'first name',
            labelStyle: const TextStyle(
                color: Color.fromRGBO(226, 222, 211, 1),
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(226, 222, 211, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _lastWidget() {
    return Stack(
      children: [
        TextField(
          controller: last_name,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            // hintText: 'Enter your full name',
            icon: Icon(Icons.abc),
            labelText: 'last name',
            labelStyle: const TextStyle(
                color: Color.fromRGBO(226, 222, 211, 1),
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(226, 222, 211, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailWidget() {
    return Stack(
      children: [
        TextField(
          controller: email,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            // hintText: 'Enter your full name',
            icon: Icon(Icons.email),
            labelText: 'email',
            labelStyle: const TextStyle(
                color: Color.fromRGBO(226, 222, 211, 1),
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(226, 222, 211, 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dobWidget() {
    return Stack(
      children: [
        TextField(
          controller: dob,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            // hintText: 'Enter your full name',
            icon: Icon(Icons.abc),
            labelText: 'date of birth',
            labelStyle: const TextStyle(
                color: Color.fromRGBO(226, 222, 211, 1),
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(226, 222, 211, 1),
              ),
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
          obscureText: true,
          controller: password,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            icon: Icon(Icons.password),
            labelText: 'Password',
            labelStyle: const TextStyle(
                color: const Color.fromRGBO(226, 222, 211, 1),
                fontWeight: FontWeight.w500,
                fontSize: 13),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(226, 222, 211, 1),
              ),
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
          map['dob'] = dob.text;
          map['first_name'] = first_name.text;
          map['last_name'] = last_name.text;
          map['email'] = email.text;
          Uri uri = Uri.parse('http://127.0.0.1:5000/register');
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
            'Sign up',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                height: 1.6),
          ),
          SizedBox.fromSize(
            size: const Size.square(70.0), // button width and height
            child: const ClipOval(
              child: Material(
                color: const Color.fromRGBO(76, 81, 93, 1),
                child: Icon(Icons.arrow_forward,
                    color: Colors.white), // button color
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _createLoginLabel() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomLeft,
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInPage())),
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          ),
        ),
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
                height: MediaQuery.of(context).size.height * 1,
                child: const SignUpContainer()),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: height * .4),
                        _typeWidget(),
                        const SizedBox(height: 20),
                        _firstWidget(),
                        const SizedBox(height: 20),
                        _lastWidget(),
                        const SizedBox(height: 20),
                        _usernameWidget(),
                        const SizedBox(height: 20),
                        _passwordWidget(),
                        const SizedBox(height: 20),
                        _emailWidget(),
                        const SizedBox(height: 20),
                        _dobWidget(),
                        const SizedBox(height: 80),
                        _submitButton(),
                        SizedBox(height: height * .050),
                        _createLoginLabel(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(top: 60, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
