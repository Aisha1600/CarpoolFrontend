import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'available_list.dart';

class OfferCarpool extends StatefulWidget {
  const OfferCarpool({super.key});

  @override
  State<OfferCarpool> createState() => _OfferCarpoolState();
}

class _OfferCarpoolState extends State<OfferCarpool> {
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  bool _isPostCarpool = false;
  bool _isViewOffers = false;
  String title = "Carpool Application";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(13),
                  child: const Text(
                    'Offer a Carpool',
                    style: TextStyle(
                      color: Color(0xFF05998c), // Will work,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
              SizedBox(height: 20),
              Row(children: [
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPostCarpool = true;
                      _isViewOffers = false;
                    });
                  },
                  child: Text(
                    'Post Carpool',
                    style: TextStyle(
                        color: _isPostCarpool ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Palanquin'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: _isPostCarpool ? Color(0xFF05998C) : Colors.white,
                    onPrimary:
                        _isPostCarpool ? Colors.white : Color(0xFF05998C),
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
                      _isPostCarpool = false;
                      _isViewOffers = true;
                    });
                  },
                  child: Text(
                    'View Offers',
                    style: TextStyle(
                        color: _isViewOffers ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Palanquin'),
                  ),
                  style: ElevatedButton.styleFrom(
                    //button
                    primary: _isViewOffers ? Color(0xFF05998C) : Colors.white,
                    onPrimary: _isViewOffers ? Colors.white : Color(0xFF05998C),
                    minimumSize: Size(190, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                    shadowColor: Colors.grey[500],
                  ),
                ),
              ]),
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
                                        _fromController.value =
                                            TextEditingValue(
                                          text: newText,
                                          selection: TextSelection.fromPosition(
                                            TextPosition(
                                                offset: newText.length),
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
                                            TextPosition(
                                                offset: newText.length),
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
                            'Edit',
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
                    ]),
              ),
              SizedBox(height: 20.0),
              if (_isPostCarpool)
                AvailableList()
              else if (_isViewOffers)
                //RequestForm()
                AvailableList()
            ],
          ),
        ),
      ),
    );
  }
}
