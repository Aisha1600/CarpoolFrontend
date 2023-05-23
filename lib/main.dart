import 'dart:async';

import 'package:carpoolfront/car_details.dart';
import 'package:carpoolfront/find_your_carpool.dart';
import 'package:carpoolfront/forgot_password.dart';
import 'package:carpoolfront/license_info.dart';
import 'package:carpoolfront/new_login.dart';
import 'package:carpoolfront/post_offer.dart';
import 'package:carpoolfront/profile.dart';
import 'package:carpoolfront/ride.dart';
import 'package:carpoolfront/select_role.dart';
import 'package:carpoolfront/view_posts.dart';
import 'Extra.dart';
import 'available_offers.dart';
import 'package:flutter/material.dart';
import 'bottom_navbar.dart';
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
      title: 'Smartpool',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.teal, fontFamily: 'Roboto-Regular'),
      home: const MyHomePage(title: 'Smartpool'),
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
  void initState() {
    super.initState();

    // Simulating a 3-second delay before hiding the progress indicator
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavbar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: Color(0xFF05998c),
            child: Center(
              child: Container(
                height: 300,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/logos.gif',
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
              ),
            )));
  }
}
