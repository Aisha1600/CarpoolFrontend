import 'package:carpoolfront/car_details.dart';
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
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
                    child: Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 250,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              )),
                          child: Image.network(
                            'https://images.pexels.com/photos/1392621/pexels-photo-1392621.jpeg',
                            fit: BoxFit.cover,
                            height: 250,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
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
                                  elevation: 5,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(0),
                                  primary: Color.fromARGB(255, 255, 255, 255),
                                  //onPrimary: Colors.white,
                                  shadowColor: Colors.grey.withOpacity(0.8),
                                ),
                                // boxShadows: [
                                //   BoxShadow(
                                //     color: Colors.grey.withOpacity(0.5),
                                //     spreadRadius: 2,
                                //     blurRadius: 5,
                                //     offset: Offset(0, 3),
                                //   ),
                                // ],
                                child: const Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Color(0xFF05998c),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          const Text('Offer Carpools'),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Column(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const FindYourCarpool()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Color(0xFF05998c),
                                //onPrimary: Colors.white,
                                shadowColor: Colors.grey.withOpacity(0.8),
                              ),
                              // boxShadows: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 2,
                              //     blurRadius: 5,
                              //     offset: Offset(0, 3),
                              //   ),
                              // ],
                              child: Center(
                                child: Icon(
                                  Icons.android,
                                  color: Colors.white,
                                ),
                              ),
                              //label: Text('Like'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          const Text('Avail Carpools'),
                        ],
                      )
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
