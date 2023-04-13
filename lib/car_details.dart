import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//for API integration
class CarDetailForm {
  late final String name;
  late final String model;
  late final String makeyear;
  late final int member_id; //this is temporary
  late final String rengo;
  late final String color;
  late final String Licenseno;
  late final String Licensevalid; //should be datetime though





  CarDetailForm(
      {
      required this.name,
      required this.model,
       required this.makeyear,
      required this.member_id, //temp
       required this.rengo,
      required this.color,
       required this.Licenseno,
      required this.Licensevalid
       });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'model': model,
      'makeyear': makeyear,
      'member_id': member_id, //temp
      'rengo': rengo,
      'color': color,
      'Licenseno': Licenseno,
       'Licensevalid': Licensevalid
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
  TextEditingController LicensenoController = TextEditingController();
  TextEditingController LicensevalidController = TextEditingController();
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
            obscureText: true,
            controller: makeyearController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Make', //this needs to be removed its not in db
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          child: TextField(
            obscureText: true,
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
            obscureText: true,
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
            obscureText: true,
            controller: colorController,
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
            controller: LicensenoController,
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
            controller: LicensevalidController,
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
              onPressed: () async {
               //API INTEGRATION
               CarDetailForm form = CarDetailForm(
              member_id: 9, //temp
              name: nameController.text,
              model: modelController.text,
              makeyear: makeyearController.text,
              rengo: rengoController.text,
              color: colorController.text,
              Licenseno: LicensenoController.text,
              Licensevalid: LicensevalidController.text)
              ;
              try {
                  
                  final jsonData = jsonEncode(form.toJson());
                  print(jsonData);
                  print(json.decode(jsonData));
                  final response = await http.post(
                    //URL LOCAL HOST NEEDS TO BE CHANGED
                    Uri.parse('http://localhost:5000/member/9/car'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonData,
                  );
                  print(response.statusCode);
                   if (response.statusCode == 200) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CarDetails()),
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
