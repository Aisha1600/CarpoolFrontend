import 'package:carpoolfront/select_role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'log_in.dart';

// ignore: unnecessary_import
//made a class to store all the fields in an object
class SignUpFOrm {
  late final String fname;
  late final String lname;
  late final String password;
  late final String phone;
  late final String cnic;
  late final String email;
  late final String gender;

  SignUpFOrm(
      {required this.fname,
      required this.lname,
      required this.password,
      required this.phone,
      required this.cnic,
      required this.email,
      required this.gender});
  Map<String, dynamic> toJson() {
    return {
      'f_name': fname,
      'l_name': lname,
      'password': password,
      'contact_no': phone,
      'cnic': cnic,
      'email': email,
      'gender': gender
    };
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String title = "Carpool Application";
  //static const baseurl = '192.168.18.222';

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final fname = fnameController.value.text;
    final lname = lnameController.value.text;
    final password = passwordController.value.text;
    final phone = phoneController.value.text;
    final cnic = cnicController.value.text;
    final email = emailController.value.text;

    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (fname.isEmpty ||
        lname.isEmpty ||
        password.isEmpty ||
        phone.isEmpty ||
        cnic.isEmpty ||
        email.isEmpty) {
      return 'Can\'t be empty';
    }
    if (password.length < 8) {
      return 'Weak Password';
    }
    if (cnic.length < 18) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  String dropdownValue = 'Not Selected';
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
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF05998c), // Will work,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: const Text(
                  'Lets Get You Started!',
                  style: TextStyle(
                      color: Color(0xFF05998c), // Will work,
                      fontSize: 25,
                      fontFamily: 'PalanquinDark-Medium'),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: fnameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: fnameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                obscureText: false,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: cnicController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CNIC',
                  labelStyle: TextStyle(fontFamily: 'PalanquinDark-Regular'),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8), // Set vertical padding to 8 pixels
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(children: [
                const Text(
                  'Gender',
                  style: TextStyle(
                    color: Color(0xFF05998c), // Will work,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 20,
                  height: 20,
                ),
                Container(
                    child: DropdownButton<String>(
                  value: dropdownValue,
                  items: <String>['Not Selected', 'Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 15),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                )),
              ]),
            ),
            Container(
                height: 90,
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                child: ElevatedButton(
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () async {
                      SignUpFOrm form = SignUpFOrm(
                          fname: fnameController.text,
                          lname: lnameController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                          cnic: cnicController.text,
                          email: emailController.text,
                          gender: dropdownValue);
                      try {
                        final jsonData = jsonEncode(
                            form.toJson()); //converts the data to json format
                        final response = await http.post(
                          //192.168.100.35
                          Uri.parse('http:localhost:4000/member/SignUp'),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonData,
                        );
                        print(response.statusCode);
                        if (response.statusCode == 200) {
                          // Item added successfully
                          final responseBody = json.decode(response.body);
                          // Gets the JWT token from the response body
                          final token = responseBody['token'];
                          print('Token from API response body:{$token}');

                          //Saves the JWT token in SharedPreferences
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('jwt_token', token);
                          print(json.decode(response.body));
                        }
                      } catch (error) {
                        print(error);
                      }
                    })),
            Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Already have an account?',
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
                    MaterialPageRoute(builder: (context) => const LogIn()),
                  );
                },
                child: const Text(
                  'Log In',
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
            )
          ]),
        ));
  }
}
