import 'package:carpoolfront/car_details.dart';
import 'package:carpoolfront/find_your_carpool.dart';
import 'package:carpoolfront/forgot_password.dart';
import 'package:carpoolfront/license_info.dart';
import 'package:carpoolfront/new_login.dart';
import 'package:carpoolfront/post_offer.dart';
import 'package:carpoolfront/select_role.dart';
import 'Extra.dart';
import 'available_offers.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'offer_carpool.dart';
import 'request_form.dart';
import 'log_in.dart';
import 'ride_details_screen.dart';
import 'map.dart';
import 'request_history.dart';
import 'new_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carpool Application',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.teal, fontFamily: 'Roboto-Regular'),
      home: const MyHomePage(title: 'Carpool Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 100,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text('Car details'),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NewSignUp()),
              );
            },
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
