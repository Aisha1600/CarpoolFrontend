import 'package:flutter/material.dart';
import 'ride_details_screen.dart';

class AvailableList extends StatelessWidget {
  AvailableList({Key? key});

  final List<Map<String, dynamic>> data = [
    {
      'name': 'Muhammad Munir',
      'from': 'DHA Phase 6',
      'to': 'Regent Plaza',
      'price': 200,
    },
    {
      'name': 'Hafeez Khan',
      'from': 'North Nazimabad',
      'to': 'Lyari',
      'price': 250,
    },
    {
      'name': 'Shafiq Khan',
      'from': 'Sohrab Goth',
      'to': 'Karachi University',
      'price': 150,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            for (final item in data)
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 80,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                          right: Radius.circular(0),
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 70,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pick up:   ${item['from']}',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Drop off:    ${item['to']}',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ride Amount: Rs${item['price']}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          CircleAvatar(
                              radius: 15,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 15,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RideDetailsScreen()),
                                      );
                                    },
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
