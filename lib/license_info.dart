import 'dart:convert';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LicenseForm {
  late final int license_no;
  late final String license_valid_from;

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
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Enter Driving License Information',
                style: TextStyle(
                  color: Color(0xFF05998c), // Will work,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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
              width: 100,
              child: Container(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  onTap: () => _selectDate(context),
                  decoration: const InputDecoration(
                    hintText: "License Valid Until:",
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
              )),
          Container(
              height: 90,
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: ElevatedButton(
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // String token = prefs.getString('jwt_token') ?? '';
                  // print('Stored jwt token from storage is {$token}');
                  // // //API INTEGRATION
                  // LicenseForm form = LicenseForm(
                  //   license_no: int.parse(LicensenoController.text.toString()),
                  //   license_valid_from: _selectedDate.toIso8601String(),
                  // );
                  // try {
                  //   final jsonData = jsonEncode(form.toJson());
                  //   print(jsonData);
                  //   print(json.decode(jsonData));
                  //   final response = await http.put(
                  //     //URL LOCAL HOST NEEDS TO BE CHANGED
                  //     Uri.parse(
                  //         'http://192.168.100.35:4000/member/InsertLicense'),
                  //     headers: {
                  //       'Content-Type': 'application/json',
                  //       'authorization': token
                  //     },
                  //     body: jsonData,
                  //   );
                  //   print(response.statusCode);
                  //   if (response.statusCode == 200) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OfferCarpool()),
                  );
                  //       print(json.decode(response.body));
                  //     }
                  //   } catch (error) {
                  //     print(error);
                  //   }
                },
              )),
        ])));
  }
}
