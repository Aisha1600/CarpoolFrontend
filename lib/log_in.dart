import 'package:carpoolfront/forgot_password.dart';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/sign_up.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginForm {
  late final String email;
  late final String password;

  LoginForm({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String title = "Carpool Application";

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
                'Log In',
                style: TextStyle(
                  color: Color(0xFF05998c), // Will work,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
            ),
          ),
          SizedBox(
              child: TextButton(
            //changes here
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgotPassword()),
              );
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Colors.grey, // Will work,
                  fontSize: 13),
            ),
          )),
          Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: ElevatedButton(
                onPressed: () async {
                  LoginForm form = LoginForm(
                      email: emailController.text,
                      password: passwordController.text);
                  try {
                    final jsonData = jsonEncode(form.toJson());
                    print(jsonData);
                    print(json.decode(jsonData));
                    final response = await http.post(
                      //URL NEEDS TO BE CHANGED TO THE IP ADDRESS
                      //AND PORT NUMBER RUNNING THE SERVER
                      //this will make server accessible from mobile app
                      //IP Address -> 192.168.100.35
                      Uri.parse('http://192.168.100.35:3000/member/loogin'),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonData,
                    );
                    print(response.statusCode);
                    if (response.statusCode == 200) {
                      print(response.body);

                      final responseBody = json.decode(response.body);
                      // Gets the JWT token from the response body
                      final token = responseBody['token'];

                      //Saves the JWT token in SharedPreferences
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('jwt_token', token);

                      // Navigator.push(
                      //   context, // fix navigation for login
                      //   MaterialPageRoute(
                      //       builder: (context) => const OfferCarpool()),
                      // );
                    }
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white, // Will work,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          ),
          Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Dont have an account?',
              style: TextStyle(
                color: Colors.black, // Will work,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () async {
                //API
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.blue, // Will work,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ])),
          const SizedBox(
            width: 40,
            height: 10,
          ),
        ])));
  }
}
