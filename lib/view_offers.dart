import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ViewOffers extends StatefulWidget {
  const ViewOffers({super.key});

  @override
  State<ViewOffers> createState() => _ViewOffersState();
}

class _ViewOffersState extends State<ViewOffers> {
  String title = "Carpool Application";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Container(
              child: const Text(
                'Your Offer Requests',
                style: TextStyle(
                  color: Color(0xFF05998C),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
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
              child: Column(children: [
                Row(
                  children: const [
                    Text(
                      'Muhammed wants a pick up from Tower 7, Bahria Town \n to Karachi University',
                      style: TextStyle(
                        color: Colors.black, // Will work,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Amount',
                          style: TextStyle(
                            color: Colors.black, // Will work,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          '500',
                          style: TextStyle(
                              color: Colors.black, // Will work,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Time',
                          style: TextStyle(
                            color: Colors.black, // Will work,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          '5:30 pm',
                          style: TextStyle(
                              color: Colors.black, // Will work,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Accept'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Reject'),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
