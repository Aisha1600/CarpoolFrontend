import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class FindYourCarpool extends StatefulWidget {
  const FindYourCarpool({super.key});

  @override
  State<FindYourCarpool> createState() => _FindYourCarpoolState();
}

class _FindYourCarpoolState extends State<FindYourCarpool> {
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Nearest Ride'),
        centerTitle: true,
        backgroundColor: Color(0xFF05998C),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find Your Nearest Ride',
              style: TextStyle(
                  color: Color(0xFF05998C),
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Palanquin Dark'),
            ),
            SizedBox(height: 16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(40.0, 0.0),
                    child: Text(
                      'Where are you?',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Palanquin'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFF05998C),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _fromController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 17.5),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.backspace,
                                  color: Color(0xFF05998C),
                                ),
                                onPressed: () {
                                  final text = _fromController.value.text;
                                  if (text.isNotEmpty) {
                                    final newText =
                                        text.substring(0, text.length - 1);
                                    _fromController.value = TextEditingValue(
                                      text: newText,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(offset: newText.length),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Transform.translate(
                    offset: Offset(40.0, 0.0),
                    child: Text(
                      'Where do you want to go?',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Palanquin'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFF05998C),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _toController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 17.5),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.backspace,
                                  color: Color(0xFF05998C),
                                ),
                                onPressed: () {
                                  final text = _toController.value.text;
                                  if (text.isNotEmpty) {
                                    final newText =
                                        text.substring(0, text.length - 1);
                                    _toController.value = TextEditingValue(
                                      text: newText,
                                      selection: TextSelection.fromPosition(
                                        TextPosition(offset: newText.length),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Palanquin'),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF05998C),
                      ),
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
