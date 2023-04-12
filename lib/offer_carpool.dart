import 'package:carpoolfront/post_offer.dart';
import 'package:flutter/material.dart';
import 'view_posts.dart';
import 'post_offer.dart';

class OfferCarpool extends StatefulWidget {
  const OfferCarpool({super.key});

  @override
  State<OfferCarpool> createState() => _OfferCarpoolState();
}

class _OfferCarpoolState extends State<OfferCarpool> {
  bool _isAvailablePressed = false;
  bool _isRequestPressed = false;
  String titleText = 'Post Offer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Offer a Carpool'),
          centerTitle: true,
          backgroundColor: const Color(0xFF05998C),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              '$titleText',
              style: TextStyle(
                color: Color(0xFF05998C),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(children: [
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAvailablePressed = true;
                    _isRequestPressed = false;
                    titleText = 'Post Offer';
                  });
                },
                child: Text(
                  'Post Offer',
                  style: TextStyle(
                    color: _isAvailablePressed ? Colors.white : Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:
                      _isAvailablePressed ? Color(0xFF05998C) : Colors.white,
                  onPrimary:
                      _isAvailablePressed ? Colors.white : Color(0xFF05998C),
                  minimumSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                    _isAvailablePressed = false;
                    _isRequestPressed = true;
                    titleText = 'View Your Posts';
                  });
                },
                child: Text(
                  'View Posts',
                  style: TextStyle(
                    color: _isRequestPressed ? Colors.white : Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  //button
                  primary: _isRequestPressed ? Color(0xFF05998C) : Colors.white,
                  onPrimary:
                      _isRequestPressed ? Colors.white : Color(0xFF05998C),
                  minimumSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  shadowColor: Colors.grey[500],
                ),
              ),
            ]),
            const SizedBox(height: 20.0),
            if (_isAvailablePressed)
              const PostOffer()
            else if (_isRequestPressed)
              const ViewPosts()
          ]),
        )));
  }
}
