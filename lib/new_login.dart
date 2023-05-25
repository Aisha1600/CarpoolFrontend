import 'dart:convert';

import 'package:carpoolfront/bottom_navbar.dart';
import 'package:carpoolfront/new_signup.dart';
import 'package:carpoolfront/select_role.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'forgot_password.dart';
import 'log_in.dart';

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

class NewLogIn extends StatefulWidget {
  const NewLogIn({super.key});

  @override
  State<NewLogIn> createState() => _NewLogInState();
}

class _NewLogInState extends State<NewLogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _areFieldsEmpty() {
    return emailController.text.isEmpty || passwordController.text.isEmpty;
  }

  bool _isEmailValid(String email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);

    return regex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    int minLength = 8; // Minimum password length requirement

    return password.length >= minLength;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          'assets/bg.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          // repeat: ImageRepeat.repeat,
        ),
        Container(
          color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.fromLTRB(30, 90, 30, 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/logos.gif',
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                ),
              ),
              const SizedBox(height: 40.0),
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
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
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
              const SizedBox(height: 16.0),
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
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
              const SizedBox(height: 4.0),
              SizedBox(
                  child: TextButton(
                //changes here
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Color(0xFFFFBE08), // Will work,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )),
              const SizedBox(height: 4.0),
              Container(
                  height: 48,
                  width: 300,
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
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_areFieldsEmpty()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all the fields.'),
                            ),
                          );
                        } else if (!_isEmailValid(emailController.text)) {
                          // Show an error message or display a Snackbar indicating that the email format is invalid
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Please enter a valid email address.'),
                            ),
                          );
                        } else if (!_isPasswordValid(passwordController.text)) {
                          // Show an error message or display a Snackbar indicating that the password is too short
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Password is incorrect.'),
                            ),
                          );
                        } else {
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
                              //KASHAF'S IP Address -> 192.168.100.35
                              Uri.parse(
                                  'http://192.168.100.35:4000/member/login'),
                              headers: {'Content-Type': 'application/json'},
                              body: jsonData,
                            );
                            print(response.statusCode);

                            if (response.statusCode == 401) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Incorrect email address or password.'),
                                ),
                              );
                            } else if (response.statusCode == 200) {
                              print(response.body);

                              final responseBody = json.decode(response.body);
                              // Gets the JWT token from the response body
                              final token = responseBody['token'];
                              print('Token from API response body:{$token}');

                              //Saves the JWT token in SharedPreferences
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('jwt_token', token);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavbar(),
                                ),
                              );
                            }
                          } catch (error) {
                            print(error);
                          }
                        }
                      })),
              const SizedBox(height: 4.0),
              Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Text(
                      'Dont have an account?',
                      style: TextStyle(
                        color: Colors.white, // Will work,
                        fontSize: 12,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        //API
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewSignUp()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFFFBE08), // Will work,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])),
            ],
          ),
        ),
      ],
    ));
  }
}
