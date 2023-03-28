import 'package:flutter/material.dart';
import 'car_details.dart';
import 'log_in.dart';
// ignore: unnecessary_import

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
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
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
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
            obscureText: true,
            controller: phoneController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: TextField(
            obscureText: true,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CNIC',
            ),
          ),
        ),
        Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: ElevatedButton(
              child: const Text(
                'Next',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CarDetails()),
                );
              },
            )),
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
            child: TextButton(
          onPressed: () {
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
