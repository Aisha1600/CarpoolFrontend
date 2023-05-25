import 'dart:convert';
import 'package:carpoolfront/car_details.dart';
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
        backgroundColor: Color(0xFFD6FFF0),
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: Center(
            child: ListView(
                padding: const EdgeInsets.only(top: 65.0, left: 18, right: 18),
                children: <Widget>[
              Container(
                  child: const Text(
                'Driving License Information',
                style: TextStyle(
                  color: Color(0xFF05998c),
                  fontSize: 26,
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: const Text(
                    'Your license information makes your profile stronger and authentic',
                    style: TextStyle(
                      color: Color.fromARGB(255, 114, 119, 118), // Will work,
                      fontSize: 14,
                    ),
                  )),
              const SizedBox(
                height: 12,
              ),
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
                  keyboardType: TextInputType.number,
                  controller: LicensenoController,
                  decoration: InputDecoration(
                    hintText: 'License Number',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 1, 43, 38),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
              const SizedBox(
                height: 15,
              ),
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
                child: TextFormField(
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    hintText: 'License Expiry Date',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 1, 43, 38),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    filled: true,
                    fillColor:
                        Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  initialValue: _selectedDate == null
                      ? ' '
                      : "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 6,
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
                      'Save',
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
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
                      //   license_no:
                      //       int.parse(LicensenoController.text.toString()),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OfferCarpool()),
                      );
                      //     print(json.decode(response.body));
                      //   }
                      // } catch (error) {
                      //   print(error);
                      // }
                    },
                  )),
            ])));
  }
}
