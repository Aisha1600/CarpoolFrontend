//may not be used for now

import 'package:carpoolfront/offer_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ViewPosts extends StatefulWidget {
  const ViewPosts({super.key});

  @override
  State<ViewPosts> createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  bool _isAvailablePressed = false;
  bool _isRequestPressed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(13),
            child: const Text(
              'Active Carpools',
              style: TextStyle(
                color: Colors.black, // Will work,
                fontSize: 20,
              ),
            )),
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
                  'From',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '246 East Street',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Seats Offered: ',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '3',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  'To',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '59 South Street',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  'Main Landmarks: ',
                  style: TextStyle(
                    color: Color(0xFFE3BCBC), // Will work,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Expo Center, Sabzi Mandi',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Date: ',
                  style: TextStyle(
                    color: Color(0xFFE3BCBC), // Will work,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '18 Nov 23',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Start time: ',
                  style: TextStyle(
                    color: Color(0xFFE3BCBC), // Will work,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '5:30 pm',
                  style: TextStyle(
                    color: Colors.black, // Will work,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width:
                        20, // adjust the width and height as per your requirements
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFE5E5E5), // button background color
                    ),
                    child: const Icon(
                      Icons.edit, // plus icon
                      color: Color(0xFF05998C), // icon color
                      size: 15, // icon size
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width:
                        20, // adjust the width and height as per your requirements
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF05998C), // button background color
                    ),
                    child: const Icon(
                      Icons.forward, // plus icon
                      color: Colors.white, // icon color
                      size: 15, // icon size
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
