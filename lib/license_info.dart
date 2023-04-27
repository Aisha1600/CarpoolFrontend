import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class License_Info extends StatefulWidget {
  const License_Info({super.key});

  @override
  State<License_Info> createState() => _License_InfoState();
}

class _License_InfoState extends State<License_Info> {
  String title = "Carpool Application";
  TextEditingController LicensenoController = TextEditingController();
  TextEditingController LicensevalidController = TextEditingController();
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
                'Enter License Information',
                style: TextStyle(
                  color: Color(0xFF05998c), // Will work,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
            child: TextField(
              controller: LicensenoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'License No.',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
            child: TextField(
              controller: LicensevalidController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valid Until',
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
                  // //API INTEGRATION
                  // CarDetailForm form = CarDetailForm(
                  //   member_id: 2, //temp
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
                  //     Uri.parse('http://localhost:5000/member/2/car'),
                  //     headers: {'Content-Type': 'application/json'},
                  //     body: jsonData,
                  //   );
                  //   print(response.statusCode);
                  //   if (response.statusCode == 200) {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const CarDetails()),
                  //     );
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
