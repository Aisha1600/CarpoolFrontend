import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RequestForm extends StatefulWidget {
  RequestForm({Key? key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovering = false;
          });
        },
        child: Container(
          color: _isHovering ? Colors.blue : Colors.red,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
