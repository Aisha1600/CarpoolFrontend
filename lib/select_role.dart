import 'package:carpoolfront/find_your_carpool.dart';
import 'package:carpoolfront/license_info.dart';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Select_Role extends StatefulWidget {
  const Select_Role({super.key});

  @override
  State<Select_Role> createState() => _Select_RoleState();
}

class _Select_RoleState extends State<Select_Role> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carpool Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              'How would you like to proceed?',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FindYourCarpool()),
                      );
                    },
                    child: const Text('Avail Carpools'),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const License_Info()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .white, // Change button background color to white
                      onPrimary: Colors.black, // Change text color to black
                    ),
                    child: const Text('Offer Carpools'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
