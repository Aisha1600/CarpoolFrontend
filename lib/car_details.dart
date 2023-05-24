import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/view_posts.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//for API integration
class CarDetailForm {
  late final String name;
  late final String model;
  late final String make_year;
  late final String car_regno;
  late final String car_color;

  CarDetailForm({
    required this.name,
    required this.model,
    required this.make_year,
    required this.car_regno,
    required this.car_color,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'make_year': make_year,
      'car_regno': car_regno,
      'car_color': car_color,
    };
  }
}

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetails();
}

class _CarDetails extends State<CarDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController makeyearController = TextEditingController();
  TextEditingController rengoController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  String title = "Carpool Application";
  String selectedValue = '';
  String dropdownValue = 'Car Model';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      backgroundColor: Color(0xFFD6FFF0),
      body: Center(
          child: ListView(
              padding: const EdgeInsets.only(top: 65.0, left: 18, right: 18),
              children: <Widget>[
            Container(
                child: const Text(
              'Vehicle Registration',
              style: TextStyle(
                color: Color(0xFF05998c), // Will work,
                fontSize: 26,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Text(
                  'Add your vehicle details so its easier for passengers to carpool with you',
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 119, 118), // Will work,
                    fontSize: 14,
                  ),
                )),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              child: DropdownButtonFormField<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 43, 38),
                ),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  fillColor: Colors.transparent,
                  filled: true,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Toyota Corolla',
                  'Suzuki Cultus',
                  'Suzuki Mehran',
                  'Suzuki Cultus'
                      'Suzuki Swift',
                  'Suzuki Wagon R',
                  'Suzuki Alto',
                  'Toyota Corolla',
                  'Toyota Hilux',
                  'Toyota Fortuner',
                  'Honda Civic',
                  'Honda City',
                  'Honda BR-V'
                      'Honda Accord',
                  'Hyundai Tucson',
                  'Hyundai Santro',
                  'Kia Sportage',
                  'Kia Picanto',
                  'FAW V2',
                  'FAW X-PV',
                  'Renault Duster',
                  'Nissan Juke'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
              child: TextField(
                controller: rengoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Registration Number',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 1, 43, 38),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
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
              child: TextField(
                controller: colorController,
                decoration: InputDecoration(
                  hintText: 'Color',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 1, 43, 38),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
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
                    'Register',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Are your sure you want to post the carpool?'),
                            actions: [
                              TextButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ViewPosts(
                                              role: 'offerer',
                                            )),
                                  );
                                },
                              ),
                            ],
                          );
                        });
                    // SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // String token = prefs.getString('jwt_token') ?? '';
                    // print(token);
                    // //API INTEGRATION
                    // CarDetailForm form = CarDetailForm(
                    //   name: nameController.text,
                    //   model: modelController.text,
                    //   make_year: makeyearController.text,
                    //   car_regno: rengoController.text,
                    //   car_color: colorController.text,
                    // );
                    // try {
                    //   final jsonData = jsonEncode(form.toJson());
                    //   print(jsonData);
                    //   print(json.decode(jsonData));
                    //   final response = await http.post(
                    //     //URL LOCAL HOST NEEDS TO BE CHANGED
                    //     Uri.parse(
                    //         'http://192.168.100.35:4000/member_car/InsertCar'),
                    //     headers: {
                    //       'Content-Type': 'application/json',
                    //       'authorization': token
                    //     },
                    //     body: jsonData,
                    //   );
                    //   print(response.statusCode);
                    //   if (response.statusCode == 200) {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ViewPosts()),
                    // );
                    //     print(json.decode(response.body));
                    //   }
                    // } catch (error) {
                    //   print(error);
                    //  }
                  },
                )),
          ])),
    );
  }
}
