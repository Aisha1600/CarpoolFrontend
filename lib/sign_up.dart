import 'package:flutter/material.dart';
import 'car_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'log_in.dart';
import 'package:postgres/postgres.dart';

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

String dropdownValue = 'M';

class _SignUp extends State<SignUp> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String title = "Carpool Application";
  static const baseurl = '192.168.18.222';

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
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

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
              'Sign Up',
              style: TextStyle(
                color: Color(0xFF05998c), // Will work,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            controller: fnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            controller: lnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: phoneController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contact Number',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CNIC',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            obscureText: false,
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'email',
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                const Text(
                  'Select gender',
                  style: TextStyle(
                    color: Color(0xFF05998c), // Will work,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  items: <String>['M', 'F']
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
                ),
              ],
            )),
        Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: ElevatedButton(
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  //final conn = await getConnection();
                  if (fnameController.text.isNotEmpty &&
                      lnameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      cnicController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      dropdownValue.isNotEmpty) {
                    SignUpFOrm form = SignUpFOrm(
                        fname: fnameController.text,
                        lname: lnameController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        cnic: cnicController.text,
                        email: emailController.text,
                        gender: dropdownValue);
                    try {
                      final client = http.Client();
                      final jsonData = jsonEncode(
                          form.toJson()); //converts the data to json format
                      print(jsonData);
                      print(json.decode(jsonData));
                      final response = await http.post(
                        Uri.parse('http://localhost:5000/member/SignUp'),
                        headers: {'Content-Type': 'application/json'},
                        body: jsonData,
                      );
                      print(response.statusCode);

                      if (response.statusCode == 200) {
                        // Item added successfully
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarDetails()),
                        );
                        print(json.decode(response.body));
                      }
                    } catch (error) {
                      print(error);
                    }
                  } else {
                    print("Fields are empty");
                  }
                })),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Already have an account?',
              style: TextStyle(
                color: Colors.black, // Will work,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            )),
        SizedBox(
            width: 20,
            height: 40,
            child: TextButton(
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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            )),
      ])),
    );
  }
}
