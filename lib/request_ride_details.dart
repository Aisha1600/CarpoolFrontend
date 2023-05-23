import 'dart:async';
import 'package:carpoolfront/request_accepted.dart';
import 'package:carpoolfront/request_sent.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RequestRideDetailsScreen extends StatefulWidget {
  @override
  _RequestRideDetailsScreenState createState() =>
      _RequestRideDetailsScreenState();
}

class _RequestRideDetailsScreenState extends State<RequestRideDetailsScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(24.8607, 67.0011),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: CachedNetworkImageProvider(
                              'https://picsum.photos/200/300',
                            ),
                          ),
                          Text(
                            'Rs100',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '123 Main St.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('San Francisco, CA 94102'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '456 Oak St.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('San Francisco, CA 94110'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // for (int i = 0; i < 5; i++)
                          //   Container(
                          //     width: 30,
                          //     height: 30,
                          //     margin: EdgeInsets.all(2),
                          //     decoration: BoxDecoration(
                          //       color: i < 3 ? Colors.white : Colors.green,
                          //       shape: BoxShape.circle,
                          //       border: Border.all(
                          //         color: Colors.grey,
                          //         width: 1,
                          //       ),
                          //     ),
                          //   ),
                          Column(
                            children: [
                              Icon(Icons.calendar_today_outlined),
                              SizedBox(height: 4),
                              Text('Apr 20'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time_outlined),
                              SizedBox(height: 4),
                              Text('2:00 PM'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Row(
                            children: [
                              Icon(Icons.star_outlined, size: 16),
                              Icon(Icons.star_outlined, size: 16),
                              Icon(Icons.star_outlined, size: 16),
                              Icon(Icons.star_outlined, size: 16),
                              Icon(Icons.star_border_outlined, size: 16),
                            ],
                          ),
                          Text('4.5 (123)'),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: Container(
                              height: 48,
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
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(13),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Send Request',
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
                                            title: Text('Message'),
                                            content: Text(
                                                'Your Carpool Request has been sent.'),
                                            actions: [
                                              // TextButton(
                                              //   child: Text('Cancel'),
                                              //   onPressed: () {
                                              //     Navigator.pop(
                                              //         context); // Close the dialog
                                              //   },
                                              // ),
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RequestAccepted()),
                                                  );
                                                  // Perform action when OK button is pressed
                                                  // Close the dialog
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  }))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
