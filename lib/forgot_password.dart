import 'package:carpoolfront/log_in.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'new_login.dart';
import 'offer_carpool.dart';

// ignore: unnecessary_import
//need to change where the API is being handled
class UpdatePassword {
  late final String password;

  UpdatePassword({required this.password});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
    };
  }
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String title = "Carpool Application";
  String jwt_token = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6FFF0),
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: ListView(
          padding: const EdgeInsets.only(top: 65.0, left: 18, right: 18),
          children: <Widget>[
            Container(
                child: const Text(
              'Update Password',
              style: TextStyle(
                color: Color(0xFF05998c), // Will work,
                fontSize: 26,
              ),
            )),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'New Password',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 1, 43, 38),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  filled: true,
                  fillColor:
                      Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 1, 43, 38),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  filled: true,
                  fillColor:
                      Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    if (newPasswordController.value ==
                        confirmPasswordController.value) {
                      UpdatePassword newpassword =
                          UpdatePassword(password: newPasswordController.text);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String token = prefs.getString('jwt_token') ?? '';
                      print(token);
                      try {
                        final jsonData = jsonEncode(newpassword.toJson());
                        print(jsonData);
                        print(json.decode(jsonData));
                        final response = await http.put(
                          Uri.parse(
                              'http://192.168.100.35:3000/member/UpdatePass'),
                          headers: {
                            'Content-Type': 'application/json',
                            'authorization': token
                          },
                          body: jsonData,
                        );
                        print(response.statusCode);
                        if (response.statusCode == 200) {
                          Navigator.push(
                            context, // fix navigation for login
                            MaterialPageRoute(
                                builder: (context) => const NewLogIn()),
                          );
                          print(json.decode(response.body));
                        }
                      } catch (error) {
                        print(error);
                      }
                    } else {}
                  },
                )),
          ]),
    );
  }
}
