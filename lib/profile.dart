import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('johndoe@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 123-456-7890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'),
              subtitle: Text('New York, USA'),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text('Company'),
                    subtitle: Text('ABC Corporation'),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Education'),
                    subtitle: Text('University of XYZ'),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Interests'),
                    subtitle: Text('Reading, Traveling, Sports'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
