import 'package:carpoolfront/forgot_password.dart';
import 'package:carpoolfront/sign_up.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore: unnecessary_import



class LoginForm {
  late final String password;
  late final String email;

  LoginForm(
      {
      required this.password,
      required this.email,
       });
  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
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
<<<<<<< HEAD
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(13),
=======
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
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        SizedBox(
            child: TextButton(
              //changes here
          onPressed:() async {

            // LoginForm form = LoginForm(
            //   email: nameController.text,
            //   password: passwordController.text);
            //   try {
                  
            //       final jsonData = jsonEncode(form.toJson());
            //       print(jsonData);
            //       print(json.decode(jsonData));
            //       final response = await http.post(
            //         //URL LOCAL HOST NEEDS TO BE CHANGED
            //         Uri.parse('http://localhost:5000/member/login'),
            //         headers: {'Content-Type': 'application/json'},
            //         body: jsonData,
            //       );
              //    print(response.statusCode);
              //     if (response.statusCode == 200) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForgotPassword()),
            );
               //   print(json.decode(response.body));
              //    }
          //  } catch (error) {
             //     print(error);
             //   }
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.blue, // Will work,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: ElevatedButton(
>>>>>>> 8c49aa0ef18680a10f5f336aeea7bb608f8b63c1
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
<<<<<<< HEAD
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgotPassword()),
              );
            },
=======
              onPressed: () async {
                 LoginForm form = LoginForm(
              email: nameController.text,
              password: passwordController.text);
              try {
                  
                  final jsonData = jsonEncode(form.toJson());
                  print(jsonData);
                  print(json.decode(jsonData));
                  final response = await http.post(
                    //URL LOCAL HOST NEEDS TO BE CHANGED
                    Uri.parse('http://localhost:5000/member/login'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonData,
                  );
                  print(response.statusCode);
                   if (response.statusCode == 200) {
            Navigator.push(
              context, // fix navigation for login
              MaterialPageRoute(builder: (context) => const ForgotPassword()),
            );
                  print(json.decode(response.body));
                  }
            } catch (error) {
                  print(error);
                }
          
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ForgotPassword()),
                // );
              },
            )),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
>>>>>>> 8c49aa0ef18680a10f5f336aeea7bb608f8b63c1
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.grey, // Will work,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ElevatedButton(
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const ForgotPassword()),
                  // );
                },
              )),
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
          )
        ]),
      ),
    );
  }
}
