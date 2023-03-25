import 'package:flutter/material.dart';
import 'password.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetails();
}

class _CarDetails extends State<CarDetails> {
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
              'Enter Car Details',
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
              labelText: 'Car Name',
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
              labelText: 'Model',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: phoneController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Make',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Make Year',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Car Registration Number',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Car Color',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'License Number',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
            controller: cnicController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'License Valid Until',
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
        SizedBox(
            width: 20,
            height: 40,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Password()),
                );
              },
              child: const Text(
                'Skip Car Details for now >',
                style: TextStyle(
                  color: Color(0xFF05998c),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ])),
    );
  }
}
