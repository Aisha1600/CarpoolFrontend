import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LicenseForm {
  late final int license_no;
  late final DateTime license_valid_from;

  LicenseForm({required this.license_no, required this.license_valid_from});

  Map<String, dynamic> toJson() {
    return {
      'license_no': license_no,
      'license_valid_from': license_valid_from,
    };
  }
}

class License_Info extends StatefulWidget {
  const License_Info({super.key});

  @override
  State<License_Info> createState() => _License_InfoState();
}

class _License_InfoState extends State<License_Info> {
  String title = "Carpool Application";
  TextEditingController LicensenoController = TextEditingController();
  TextEditingController LicensevalidController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
                'Enter your Driving License Information',
                style: TextStyle(
                  color: Color(0xFF05998c), // Will work,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: LicensenoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'License No.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: TextFormField(
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                hintText: "License Valid Until: ",
              ),
              initialValue: _selectedDate == null
                  ? ' '
                  : "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
              // child: Row(
              //   children: [
              //     Text(),
              //     Text(
              //         "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}"),
              //   ],
              //),
            ),
          ),
          Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ElevatedButton(
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String token = prefs.getString('jwt_token') ?? '';
                  print(token);
                  // //API INTEGRATION
                  LicenseForm form = LicenseForm(
                    license_no: int.parse(LicensenoController.text.toString()),
                    license_valid_from: _selectedDate,
                  );
                  try {
                    final jsonData = jsonEncode(form.toJson());
                    print(jsonData);
                    print(json.decode(jsonData));
                    final response = await http.post(
                      //URL LOCAL HOST NEEDS TO BE CHANGED
                      Uri.parse('http://localhost:4000/member/InsertLicense'),
                      headers: {
                        'Content-Type': 'application/json',
                        'authorization': token
                      },
                      body: jsonData,
                    );
                    print(response.statusCode);
                    if (response.statusCode == 200) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const CarDetails()),
                      // );
                      print(json.decode(response.body));
                    }
                  } catch (error) {
                    print(error);
                  }
                },
              )),
        ])));
  }
}
