import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profileModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> member = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    //fetchMember();
  }

  // Future<List<ProfileModel>> fetchMember() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('jwt_token') ?? '';
  //   print(token);

  //   try {
  //     // Make the HTTP GET request to retrieve member data
  //     final response = await http.get(
  //       Uri.parse(
  //           'http://192.168.100.35:4000/member/displayProfile'), // Replace with your API endpoint
  //       headers: {'Content-Type': 'application/json', 'authorization': token},
  //     );

  //     var member = <ProfileModel>[];

  //     if (response.statusCode == 200) {
  //       // If the request is successful (status code 200), parse the response body
  //       final responseData = json.decode(response.body);
  //       print(responseData);

  //       // setState(() {
  //       //   member = responseData;
  //       //   isLoading = false;
  //       // });
  //     } else {
  //       throw Exception('Failed to fetch member');
  //     }
  //   } catch (error) {
  //     print(error);
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CircleAvatar(
                  //   // Display member profile picture
                  //   radius: 50,
                  //   backgroundImage: NetworkImage(member['profile_picture']),
                  // ),
                  // SizedBox(height: 16.0),
                  Text(
                    'Name ${member['f_name']} ${member['l_name']} ',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Email ${member['email']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8.0),
                  // Text(
                  //   'Bio: ${member['bio']}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  // Add more Text widgets to display other member information
                ],
              ),
            ),
    );
  }
}
