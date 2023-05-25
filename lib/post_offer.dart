import 'package:carpoolfront/car_details.dart';
import 'package:carpoolfront/offer_requests.dart';
import 'package:carpoolfront/places_services.dart';
import 'package:carpoolfront/search_list.dart';
import 'package:carpoolfront/view_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'find_your_carpool.dart';

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
  final placesService = PlacesService();
  var fromLatLng;
  var toLatLng;

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
    String formattedDate = DateFormat('MMM d, yyy').format(_selectedDate);
    String formattedTime = DateFormat('hh:mm a')
        .format(DateTime(2023, 1, 1, _selectedTime.hour, _selectedTime.minute));
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Transform.translate(
                      offset: Offset(40.0, 0.0),
                      child: Text(
                        'Where are you?',
                        style: TextStyle(
                          fontSize: 12.0,
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
                            height: 40,
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
                              style: TextStyle(fontSize: 10),
                              controller: _fromController,
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (newContext) =>
                                          const SearchList()),
                                );
                                if (result != null) {
                                  String placeId = result.placeId;
                                  LatLng latLng =
                                      await placesService.fetchLatLng(placeId);
                                  if (latLng != null) {
                                    fromLatLng = GetLatLng(
                                        latLng.latitude, latLng.longitude);
                                  }
                                  print(latLng.latitude);
                                  print(latLng.longitude);
                                  setState(() {
                                    print(result.placeId);
                                    print(result.place);
                                    print('idk');
                                    _fromController.text = result.place;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 5),
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
                          fontSize: 12.0,
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
                            height: 40,
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
                              style: TextStyle(fontSize: 10),
                              controller: _toController,
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (newContext) => SearchList()),
                                );
                                if (result != null) {
                                  String placeId = result.placeId;
                                  LatLng latLng =
                                      await placesService.fetchLatLng(placeId);
                                  if (latLng != null) {
                                    toLatLng = GetLatLng(
                                        latLng.latitude, latLng.longitude);
                                  }
                                  print(toLatLng.latitude);
                                  print(latLng.longitude);
                                  setState(() {
                                    print(result.placeId);
                                    print(result.place);
                                    _toController.text = result.place;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 5),
                                // suffixIcon: IconButton(
                                //   icon: Icon(
                                //     Icons.backspace,
                                //     color: Color(0xFF05998C),
                                //   ),
                                //   onPressed: () {
                                //     final text = _toController.value.text;
                                //     if (text.isNotEmpty) {
                                //       final newText =
                                //           text.substring(0, text.length - 1);
                                //       _toController.value = TextEditingValue(
                                //         text: newText,
                                //         selection: TextSelection.fromPosition(
                                //           TextPosition(offset: newText.length),
                                //         ),
                                //       );
                                //     }
                                //   },
                                // ),
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
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF05998C),
                          minimumSize: Size(100, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          shadowColor: Colors.grey[500],
                        ),
                      ),
                    ),
                  ]),
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
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 12.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Row(
                                children: [
                                  //Text(),
                                  Text(
                                    "$formattedDate",
                                    // "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
                                    style: TextStyle(
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: 100,
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
                            child: GestureDetector(
                              onTap: () => _selectTime(context),
                              child: Row(
                                children: [
                                  //Text("Time: "),
                                  Text(
                                    "$formattedTime",
                                    //"${_selectedTime.hour}:${_selectedTime.minute}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                        fontSize: 12.0,
                        //fontWeight: FontWeight.bold,
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
                          color: Color(0xFFFFBE08), // button background color
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
                              color:
                                  Colors.grey.withOpacity(0.5), // shadow color
                              spreadRadius: 5, // spread radius
                              blurRadius: 7, // blur radius
                              offset: const Offset(0, 3), // offset
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(10), // border radius
                          color: Colors.white, // container background color
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          radius: 30,
                          child: Text(
                            '$_seats',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )),
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
                          color: Color(0xFFFFBE08), // button background color
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
                          fontSize: 12.0,
                          //fontWeight: FontWeight.bold,
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
                          primary: _male ? Color(0xFFFFBE08) : Colors.white,
                          onPrimary: _male ? Colors.white : Color(0xFFFFBE08),
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
                          primary: _female ? Color(0xFFFFBE08) : Colors.white,
                          onPrimary: _female ? Colors.white : Color(0xFFFFBE08),
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
                          primary: _none ? Color(0xFFFFBE08) : Colors.white,
                          onPrimary: _none ? Colors.white : Color(0xFFFFBE08),
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
                          fontSize: 12.0,
                          //fontWeight: FontWeight.bold,
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
                        activeTrackColor: Color(0xFFFFBE08),
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
                          fontSize: 12.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
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
                      'Post Offer',
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
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

                      //getting the member token and decoding it to get member related data
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String token = prefs.getString('jwt_token') ?? '';

                      try {
                        final member_car = await http.post(
                          Uri.parse(
                              'http://192.168.100.35:4000/getMemberCarId'),
                          headers: {
                            'Content-Type': 'application/json',
                            'authorization': token
                          },
                        );
                        print(member_car.statusCode);
                        if (member_car.statusCode == 404) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CarDetails()),
                          );
                        } else if (member_car.statusCode == 200) {
                          final jsonData1 = jsonEncode(offer.toJson());
                          print(jsonData1);
                          print(json.decode(jsonData1));

                          final jsonData2 = jsonEncode(preferences.toJson());
                          print(jsonData2);
                          print(json.decode(jsonData2));

                          final response1 = await http.post(
                            Uri.parse('http://192.168.100.35:4000/JRide'),
                            headers: {
                              'Content-Type': 'application/json',
                              'authorization': token
                            },
                            body: jsonData1,
                          );

                          final response2 = await http.post(
                            //URL LOCAL HOST NEEDS TO BE CHANGED
                            Uri.parse(
                                'http://192.168.100.35:4000/AddPreference'),
                            headers: {
                              'Content-Type': 'application/json',
                              'authorization': token
                            },
                            body: jsonData2,
                          );

                          print(response1.statusCode);
                          print(response2.statusCode);

                          if (response1.statusCode == 200 &&
                              response2.statusCode == 201) {
                            print(json.decode(response1.body));
                            print(response1.statusCode);

                            final responseBody = json.decode(response1.body);
                            // Gets and prints the ride JWT token from the response body of the /ride/JRide api
                            final ride_token = responseBody['token'];
                            print('Token from API response body:{$ride_token}');

                            //Saves the ride JWT token in SharedPreferences
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('ride_token', ride_token);
                            print(json.decode(response1.body));

                            print(json.decode(response2.body));
                            print(
                                'Preference was added with response code {$response2.statusCode}');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ViewPosts(role: 'offerer')),
                            );
                          }
                        }
                      } catch (error) {
                        print(error);
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
