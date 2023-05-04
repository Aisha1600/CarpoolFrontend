import 'package:carpoolfront/log_in.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: ListView(children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(13),
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                color: Color(0xFF05998c), // Will work,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
        Container(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Password',
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm Password',
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            ),
          ),
        ),
        Container(
            height: 90,
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
            child: ElevatedButton(
              child: const Text(
                'Update Password',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () async {
                // if (newPasswordController.value ==
                //     confirmPasswordController.value) {
                //   UpdatePassword newpassword =
                //       UpdatePassword(password: newPasswordController.text);
                //   SharedPreferences prefs =
                //       await SharedPreferences.getInstance();
                //   String token = prefs.getString('jwt_token') ?? '';
                //   print(token);
                //   try {
                //     final jsonData = jsonEncode(newpassword.toJson());
                //     print(jsonData);
                //     print(json.decode(jsonData));
                //     final response = await http.put(
                //       Uri.parse('http://192.168.100.35:3000/member/UpdatePass'),
                //       headers: {
                //         'Content-Type': 'application/json',
                //         'authorization': token
                //       },
                //       body: jsonData,
                //     );
                //     print(response.statusCode);
                //     if (response.statusCode == 200) {
                Navigator.push(
                  context, // fix navigation for login
                  MaterialPageRoute(builder: (context) => const LogIn()),
                );
                //       print(json.decode(response.body));
                //     }
                //   } catch (error) {
                //     print(error);
                //   }
                // } else {}
              },
            )),
      ])),
    );
  }
}
