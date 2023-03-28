import 'package:carpoolfront/available_list.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'available_list.dart';
import 'request_form.dart';

class FindYourCarpool extends StatefulWidget {
  const FindYourCarpool({super.key});

  @override
  State<FindYourCarpool> createState() => _FindYourCarpoolState();
}

class _FindYourCarpoolState extends State<FindYourCarpool> {
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  bool _isAvailablePressed = false;
  bool _isRequestPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Nearest Ride'),
        centerTitle: true,
        backgroundColor: Color(0xFF05998C),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          minimumSize: Size(130, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(children: [
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isAvailablePressed = true;
                      _isRequestPressed = false;
                    });
                  },
                  child: Text(
                    'Available',
                    style: TextStyle(
                        color:
                            _isAvailablePressed ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Palanquin'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:
                        _isAvailablePressed ? Color(0xFF05998C) : Colors.white,
                    onPrimary:
                        _isAvailablePressed ? Colors.white : Color(0xFF05998C),
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                    shadowColor: Colors.grey[500],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isAvailablePressed = false;
                      _isRequestPressed = true;
                    });
                  },
                  child: Text(
                    'Request',
                    style: TextStyle(
                        color: _isRequestPressed ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Palanquin'),
                  ),
                  style: ElevatedButton.styleFrom(
                    //button
                    primary:
                        _isRequestPressed ? Color(0xFF05998C) : Colors.white,
                    onPrimary:
                        _isRequestPressed ? Colors.white : Color(0xFF05998C),
                    minimumSize: Size(190, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                    shadowColor: Colors.grey[500],
                  ),
                ),
              ]),
              SizedBox(height: 20.0),
              if (_isAvailablePressed)
                AvailableList()
              else if (_isRequestPressed)
                RequestForm()
            ],
          ),
        ),
      ),
    );
  }
}
