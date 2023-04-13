import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//for API integration
class CarDetailForm {
  late final String name;
  late final String model;
  late final String make_year;
  late final int member_id; //this is temporary
  late final String car_regno;
  late final String car_color;

  CarDetailForm({
    required this.name,
    required this.model,
    required this.make_year,
    required this.member_id, //temp
    required this.car_regno,
    required this.car_color,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'make_year': make_year,
      'member_id': member_id, //temp
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
  // TextEditingController LicensenoController = TextEditingController();
  // TextEditingController LicensevalidController = TextEditingController();
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
            controller: modelController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Model',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            controller: makeyearController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Make Year',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            controller: rengoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Car Registration Number',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            controller: colorController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Car Color',
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
              onPressed: () async {
                //API INTEGRATION
                CarDetailForm form = CarDetailForm(
                  member_id: 2, //temp
                  name: nameController.text,
                  model: modelController.text,
                  make_year: makeyearController.text,
                  car_regno: rengoController.text,
                  car_color: colorController.text,
                );
                try {
                  final jsonData = jsonEncode(form.toJson());
                  print(jsonData);
                  print(json.decode(jsonData));
                  final response = await http.post(
                    //URL LOCAL HOST NEEDS TO BE CHANGED
                    Uri.parse('http://localhost:5000/member/2/car'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonData,
                  );
                  print(response.statusCode);
                  if (response.statusCode == 200) {
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
              },
            )),
        SizedBox(
            width: 20,
            height: 40,
            child: TextButton(
              onPressed: () {},
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
