import 'package:carpoolfront/new_login.dart';
import 'package:carpoolfront/new_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Enter extends StatefulWidget {
  const Enter({super.key});

  @override
  State<Enter> createState() => _EnterState();
}

class _EnterState extends State<Enter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Image.asset(
        'assets/bg.jpeg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        // repeat: ImageRepeat.repeat,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/logos.gif',
          fit: BoxFit.cover,
          height: 250,
          width: double.infinity,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        'Log In',
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewLogIn()),
                        );
                      })),
              SizedBox(
                height: 20,
              ),
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
                        'Sign Up',
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewSignUp()),
                        );
                      })),
            ]),
      )
    ]));
  }
}
