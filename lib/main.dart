import 'package:carpoolfront/find_your_carpool.dart';
import 'Extra.dart';
import 'available_list.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'offer_carpool.dart';
import 'request_form.dart';
import 'log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carpool Application',
      theme: ThemeData(
          primarySwatch: Colors.teal, fontFamily: 'PalanquinDark-Medium'),
      home: const MyHomePage(title: 'Carpool Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text('OFFER CARPOOL PAGE'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUp()),
              );
            },
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
