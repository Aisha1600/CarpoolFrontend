//may not be used for now
import 'dart:async';
import 'package:carpoolfront/offer_requests.dart';
import 'package:carpoolfront/ContainerPopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'bottom_navbar.dart';

class ViewPosts extends StatefulWidget {
  const ViewPosts({super.key});

  @override
  State<ViewPosts> createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  //bool _isAvailablePressed = false;
  //bool _isRequestPressed = false;

  void initState() {
    super.initState();

    // Simulating a 3-second delay before hiding the progress indicator
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContainerStack()),
      );
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
