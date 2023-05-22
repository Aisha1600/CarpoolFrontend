import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Ride extends StatefulWidget {
  const Ride({super.key});

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image Widget
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue, // Replace with your desired image
              // Add your image widget here
            ),
          ),
          // Scrollable Container
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Your Passengers...'),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: null), // Checkbox 1
                              SizedBox(width: 8.0),
                              Text('Marked as picked up'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: null), // Checkbox 2
                              SizedBox(width: 8.0),
                              Text('Marked as dropped off'),
                            ],
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  height: 45,
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Proceed',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      onPressed: () async {}))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Checkbox(
                                  value: false, onChanged: null), // Checkbox 1
                              SizedBox(width: 8.0),
                              Text('Marked as picked up'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: false, onChanged: null), // Checkbox 2
                              SizedBox(width: 8.0),
                              Text('Marked as dropped off'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 45,
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
                                  'Proceed',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                onPressed: () async {}))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
