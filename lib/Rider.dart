import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/post_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Rider extends StatefulWidget {
  const Rider({super.key});

  @override
  State<Rider> createState() => _RiderState();
}

class _RiderState extends State<Rider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // Image Widget
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.blue,
          child: Image.asset(
            'assets/map.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            // repeat: ImageRepeat.repeat,
          ), // Replace with your desired image
          // Add your image widget here
        ),
      ),
      // Scrollable Container
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your ride is on its way',
                style: TextStyle(
                  color: Colors.black, // Will work,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                                'assets/bg.jpeg'), // Replace with your image asset
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Driver',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Hanif Khan',
                            style: TextStyle(
                                fontSize: 11,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(width: 30.0),
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Container(
                              height: 80,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pick up',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'ETA',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 2,
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '5:30 pm',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          '6:15pm',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ]),
                                ],
                              ),
                            ),

                            // Divider(
                            //     // thickness: 2,
                            //     // height: 1,
                            //     ),
                            SizedBox(
                              height: 1,
                              width: 200,
                              child: Container(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Vehicle details',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Blue Alto',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 42),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 2,
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BFG-662',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 1,
                              width: 200,
                              child: Container(
                                color: Colors.grey,
                              ),
                            ),
                          ])),
                      //Text("data")
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Divider(
                      //   thickness: 2,
                      //   height: 1,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        height: 45,
                        width: 100,
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
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.alarm,
                                color: Colors.white,
                                //size: 20,
                              ),
                            ),
                            onPressed: () async {}))),
                SizedBox(
                  width: 10,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 45,
                        width: 100,
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
                            child: Center(
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                                //size: 20,
                              ),
                            ),
                            onPressed: () async {}))),
                SizedBox(
                  width: 10,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 45,
                        width: 100,
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
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                ),

                                //size: 20,
                              ),
                            ),
                            onPressed: () async {}))),
              ],
            )
          ]),
        ),
      )
    ]));
  }
}
