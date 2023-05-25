import 'package:carpoolfront/car_details.dart';
import 'package:carpoolfront/find_your_carpool.dart';
import 'package:carpoolfront/license_info.dart';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'bottom_navbar.dart';

class Select_Role extends StatefulWidget {
  const Select_Role({super.key});

  @override
  State<Select_Role> createState() => _Select_RoleState();
}

class _Select_RoleState extends State<Select_Role> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Select_Role(),
    OfferCarpool(),
    FindYourCarpool()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6FFF0),
      // appBar: AppBar(
      //     //title: Text('Loading Screen'),
      //     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 70,
            ),
            Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/homeposter.jpeg',
                      fit: BoxFit.cover,
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
                            height: 110,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const OfferCarpool()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,

                                //shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Color(0xFFFFBE08),
                                //onPrimary: Colors.white,
                                shadowColor: Colors.grey.withOpacity(0.8),
                              ),
                              //child: Center(
                              child: Image.asset('assets/offer.png'),
                              //Icon(
                              //   Icons.favorite,
                              //   color: Color(0xFF05998c),
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const FindYourCarpool()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                //shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Color(0xFFFFBE08),
                                //onPrimary: Colors.white,
                                shadowColor: Colors.grey.withOpacity(0.8),
                              ),
                              child: Image.asset('assets/find.png'),
                              //child: const Text('Find Carpool'),
                              // Icon(
                              //   Icons.android,
                              //   color: Colors.white,
                              // ),
                              //),
                              //label: Text('Like'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (BuildContext context) =>
                                //           const FindYourCarpool()),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                //shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Color(0xFFFFBE08),
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
                              child: Image.asset('assets/reviews.png'),
                              // Icon(
                              //   Icons.android,
                              //   color: Colors.white,
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (BuildContext context) =>
                                //           const License_Info()),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                //shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Color(0xFFFFBE08),
                                //onPrimary: Colors.white,
                                shadowColor: Colors.grey.withOpacity(0.8),
                              ),
                              child: Image.asset('assets/policies.png'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
