import 'package:carpoolfront/view_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateOffer {
  late final String destination_name;
  late final String source_name;
  late final String created_on;
  late final String travel_start_time;
  late final int seats_offered;
  late final int contribution_per_head;

  CreateOffer(
      {required this.destination_name,
      required this.source_name,
      required this.created_on,
      required this.travel_start_time,
      required this.seats_offered,
      required this.contribution_per_head});

  Map<String, dynamic> toJson() {
    return {
      'destination_name': destination_name,
      'source_name': source_name,
      'created_on': created_on,
      'travel_start_time': travel_start_time,
      'seats_offered': seats_offered,
      'contribution_per_head': contribution_per_head
    };
  }
}

class MemberPreferences {
  late final String is_smoking_allowed;
  late final String is_all_female;
  late final String notes;

  MemberPreferences(
      {required this.is_smoking_allowed,
      required this.is_all_female,
      required this.notes});

  Map<String, dynamic> toJson() {
    return {
      'is_smoking_allowed': is_smoking_allowed,
      'is_all_female': is_all_female,
      'notes': notes,
    };
  }
}

class PostOffer extends StatefulWidget {
  const PostOffer({super.key});

  @override
  State<PostOffer> createState() => _PostOfferState();
}

class _PostOfferState extends State<PostOffer> {
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  String is_all_female = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _male = false;
  bool _female = false;
  bool _none = false;
  bool isSwitched = false;
  String is_smoking_allowed = 'No';
  int _seats = 0;
  String notes = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  void _incrementSeats() {
    setState(() {
      if (_seats >= 0 && _seats < 5) {
        _seats++;
      }
    });
  }

  void _decrementSeats() {
    setState(() {
      if (_seats > 0) {
        _seats--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Transform.translate(
              offset: Offset(40.0, 0.0),
              child: Text(
                'Where are you?',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                ),
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
                ),
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
                  'Edit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
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
            ),
            const SizedBox(height: 20.0),
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
                  Row(
                    children: [
                      const Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              onTap: () => _selectDate(context),
                              decoration: InputDecoration(
                                hintText: "Date: ",
                                border: InputBorder.none,
                              ),
                              initialValue: _selectedDate == null
                                  ? ' '
                                  : "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
                              // child: Row(
                              //   children: [
                              //     Text(),
                              //     Text(
                              //         "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}"),
                              //   ],
                              //),
                            ),
                          ),
                          Container(
                            width: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // shadow color
                                  spreadRadius: 5, // spread radius
                                  blurRadius: 7, // blur radius
                                  offset: const Offset(0, 3), // offset
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.circular(10), // border radius
                              color: Colors.white, // container background color
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () => _selectTime(context),
                                child: Row(
                                  children: [
                                    Text(
                                      "${_selectedTime.hour}:${_selectedTime.minute}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(children: [
                    const Text(
                      'Seats Available',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _incrementSeats();
                      },
                      child: Container(
                        width:
                            30, // adjust the width and height as per your requirements
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF05998C), // button background color
                        ),
                        child: const Icon(
                          Icons.add, // plus icon
                          color: Colors.white, // icon color
                          size: 20, // icon size
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 20,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: const Offset(0, 3), // offset
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(10), // border radius
                        color: Colors.white, // container background color
                      ),
                      child: Text(
                        '$_seats',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        _decrementSeats();
                      },
                      child: Container(
                        width:
                            30, // adjust the width and height as per your requirements
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF05998C), // button background color
                        ),
                        child: const Icon(
                          Icons.remove, // plus icon
                          color: Colors.white, // icon color
                          size: 20, // icon size
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Preferances',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5.4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _male = true;
                            _female = false;
                            _none = false;
                            is_all_female = 'No';
                          });
                        },
                        child: Text(
                          'Male',
                          style: TextStyle(
                            color: _male ? Colors.white : Colors.black,
                            fontSize: 10.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              _male ? const Color(0xFF05998C) : Colors.white,
                          onPrimary:
                              _male ? Colors.white : const Color(0xFF05998C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(width: 1.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _male = false;
                            _female = true;
                            _none = false;
                            is_all_female = 'Yes';
                          });
                        },
                        child: Text(
                          'Female',
                          style: TextStyle(
                              color: _female ? Colors.white : Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          //button
                          primary:
                              _female ? const Color(0xFF05998C) : Colors.white,
                          onPrimary:
                              _female ? Colors.white : const Color(0xFF05998C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(width: 1.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _male = false;
                            _female = false;
                            _none = true;
                            is_all_female = 'No';
                          });
                        },
                        child: Text(
                          'None',
                          style: TextStyle(
                              color: _none ? Colors.white : Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          //button
                          primary:
                              _none ? const Color(0xFF05998C) : Colors.white,
                          onPrimary:
                              _none ? Colors.white : const Color(0xFF05998C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Is smoking allowed?',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;

                            if (isSwitched == true) {
                              is_smoking_allowed = 'Yes';
                            } else {
                              is_smoking_allowed = 'No';
                            }
                          });
                        },
                        activeTrackColor: const Color(0xFF05998C),
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 90,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ElevatedButton(
                    child: const Text(
                      'Post Offer',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () async {
                      DateTime time = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        _selectedTime.hour,
                        _selectedTime.minute,
                      );

                      CreateOffer offer = CreateOffer(
                          destination_name: _fromController.text.toString(),
                          source_name: _toController.text.toString(),
                          created_on: _selectedDate.toIso8601String(),
                          travel_start_time: time.toIso8601String(),
                          seats_offered: _seats,
                          contribution_per_head: 9);

                      MemberPreferences preferences = MemberPreferences(
                          is_smoking_allowed: is_smoking_allowed,
                          is_all_female: is_all_female,
                          notes: "These are some additional notes....");

                      try {
                        final jsonData1 = jsonEncode(offer.toJson());
                        print(jsonData1);
                        print(json.decode(jsonData1));

                        final jsonData2 = jsonEncode(preferences.toJson());
                        print(jsonData2);
                        print(json.decode(jsonData2));

                        final response1 = await http.post(
                          Uri.parse(
                              'http://localhost:4000/member_car/1/createRidee'),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonData1,
                        );

                        final response2 = await http.post(
                          //URL LOCAL HOST NEEDS TO BE CHANGED
                          Uri.parse(
                              'http://localhost:4000/member/2/preference'),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonData2,
                        );

                        print(response1.statusCode);
                        print(response2.statusCode);

                        if (response1.statusCode == 200 &&
                            response2.statusCode == 201) {
                          print(json.decode(response1.body));
                          print(response1.statusCode);
                          print(json.decode(response2.body));
                          print(response2.statusCode);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewOffers()),
                          );
                        }
                      } catch (error) {
                        print(error);
                      }
                    })),
          ]),
        ),
      ],
    );
  }
}
