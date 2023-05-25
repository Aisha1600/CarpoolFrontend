import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/post_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class Ride extends StatefulWidget {
  const Ride({super.key});

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool started = false;
  String end = 'Start';

  _makingPhoneCall() async {
    var url = Uri.parse("tel:03342340689");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6FFF0),
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
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Passengers...',
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
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // Specify the desired color
                          width: 2.0, // Specify the desired border width
                        ),
                      ),
                    ),
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
                                  'Hanif Khan',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick up from Sohrab Goth',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          isChecked1, // Set the initial value of the checkbox
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked1 = value ??
                                              false; // Update the state of the checkbox
                                        });
                                      },
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      'Marked as picked up',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Drop off at Malir',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          isChecked2, // Set the initial value of the checkbox
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked2 = value ??
                                              false; // Update the state of the checkbox
                                        });
                                      },
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      'Marked as picked up',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                                    child: Center(
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        //size: 20,
                                      ),
                                    ),
                                    onPressed: () async {
                                      _makingPhoneCall();
                                    }))),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // Specify the desired color
                          width: 2.0, // Specify the desired border width
                        ),
                      ),
                    ),
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
                                      'assets/pic.jpeg'), // Replace with your image asset
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Ali Ahmad',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick up from Sohrab Goth',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          isChecked3, // Set the initial value of the checkbox
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked3 = value ??
                                              false; // Update the state of the checkbox
                                        });
                                      },
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      'Marked as picked up',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Drop off at Malir',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          isChecked4, // Set the initial value of the checkbox
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked4 = value ??
                                              false; // Update the state of the checkbox
                                        });
                                      },
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      'Marked as picked up',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                                    child: Center(
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        //size: 20,
                                      ),
                                    ),
                                    onPressed: () async {
                                      _makingPhoneCall();
                                    }))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                      primary: started ? Colors.red : Color(0xFF05998C),
                    ),
                    child: Text('${end}'),
                    onPressed: () async {
                      setState(() {
                        started = true;
                        end = 'End';
                        if (started == true && end == 'End') {
                          if (isChecked1 != true ||
                              isChecked2 != true ||
                              isChecked3 != true ||
                              isChecked4 != true) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Message'),
                                    content: Text(
                                        'Cannot end ride until all passengers have been picked and dropped.'),
                                    actions: [
                                      TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                      ),
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          // Perform action when OK button is pressed
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Message'),
                                    content: Text(
                                        'Your ride has been marked as completed!'),
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
                                                    OfferCarpool()),
                                          );
                                          // Perform action when OK button is pressed
                                          // Close the dialog
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }
                        }
                        //titleText = 'Available Requests';
                      });
                    }))),
        SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
