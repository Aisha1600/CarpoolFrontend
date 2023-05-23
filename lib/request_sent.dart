//may not be used for now
import 'dart:async';
import 'package:carpoolfront/Rider.dart';
import 'package:carpoolfront/offer_requests.dart';
import 'package:carpoolfront/ContainerPopup.dart';
import 'package:carpoolfront/ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'bottom_navbar.dart';

class RequestSent extends StatefulWidget {
  const RequestSent({super.key});

  @override
  State<RequestSent> createState() => _RequestSentState();
}

class _RequestSentState extends State<RequestSent> {
  //bool _isAvailablePressed = false;
  //bool _isRequestPressed = false;

  void initState() {
    super.initState();

    // Simulating a 3-second delay before hiding the progress indicator
    Timer(Duration(seconds: 5), () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Message'),
              content: Text('Your ride offer has been accepted.'),
              actions: [
                //   TextButton(
                //     child: Text('Cancel'),
                //     onPressed: () {
                //       Navigator.pop(context); // Close the dialog
                //     },
                //   ),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Ride()),
                    );
                    // Perform action when OK button is pressed
                    // Close the dialog
                  },
                ),
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Loading Screen'),
          ),
      body: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 25,
            ),
            Text('Waiting...')
          ],
        )),
      ),
    );
  }
}
