import 'package:carpoolfront/available_list.dart';
import 'package:carpoolfront/post_offer.dart';
import 'package:flutter/material.dart';

class OfferCarpool extends StatefulWidget {
  const OfferCarpool({super.key});

  @override
  State<OfferCarpool> createState() => _OfferCarpoolState();
}

class _OfferCarpoolState extends State<OfferCarpool> {
  bool _isAvailablePressed = false;
  bool _isRequestPressed = false;
  String titleText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD6FFF0),
        appBar: AppBar(
          // title: const Text('Carpool Application'),
          // centerTitle: true,
          backgroundColor: const Color(0xFF05998C),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 16),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAvailablePressed = true;
                        _isRequestPressed = false;
                        //titleText = 'Post Carpool Offer';
                      });
                    },
                    child: Text(
                      'Post Carpool',
                      style: TextStyle(
                        color:
                            _isAvailablePressed ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: _isAvailablePressed
                          ? Color(0xFF05998C)
                          : Colors.white,
                      onPrimary: _isAvailablePressed
                          ? Colors.white
                          : Color(0xFF05998C),
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
                        //titleText = 'Available Requests';
                      });
                    },
                    child: Text(
                      'Available Requests',
                      style: TextStyle(
                        color: _isRequestPressed ? Colors.white : Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //button
                      primary:
                          _isRequestPressed ? Color(0xFF05998C) : Colors.white,
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
              AvailableList()
          ]),
        )));
  }
}
