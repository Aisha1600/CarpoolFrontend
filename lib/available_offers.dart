// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Offers {
//   final int destination_id;
//   final String created_on;
//   final String travel_start_time;
//   int seats_offered;
//   int contribution_per_head;
//   int member_id;
//   int ride_id;
//   int ride_token;

//   Offers(
//       {required this.destination_id,
//       required this.created_on,
//       required this.travel_start_time,
//       required this.member_id,
//       required this.ride_id,
//       required this.contribution_per_head,
//       required this.ride_token,
//       required this.seats_offered});

//   factory Offers.fromJson(Map<String, dynamic> json) {
//     return Offers(
//       destination_id: json['destination_id'],
//       created_on: json['created_on'],
//       travel_start_time: json['travel_start_time'],
//       member_id: json['member_id'],
//       ride_id: json['ride_id'],
//       contribution_per_head: json['contribution_per_head'],
//       ride_token: json['ride_token'],
//       seats_offered: json['seats_offered'],
//     );
//   }
// }

// class AvailableOffers extends StatelessWidget {
//   const AvailableOffers({Key? key});
//   // late List<Offers> _offers;

//   // void initState() {
//   //   super.initState();
//   //   _getOffers();
//   // }

//   // Future<void> _getOffers() async {
//   //   final response = await http.get(Uri.parse('http://'));
//   //   final List<Offers> offers = (jsonDecode(response.body) as List)
//   //       .map((data) => Offers.fromJson(data))
//   //       .toList();
//   //   setState(() {
//   //     _offers = offers;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Expanded(
//         child: Column(
//           children: [
//             for (final item in _offers)
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       offset: Offset(0, 2),
//                       blurRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                         child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'From: Tariq Road',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'To: IBA Karachi',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             'Ride Amount: \Rs300',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//                     IconButton(
//                       icon: Icon(Icons.arrow_forward_ios),
//                       onPressed: () {
//                         // Handle arrow icon click
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
