import 'package:flutter/material.dart';

class CustomLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0;

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(CustomLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomLinePainter oldDelegate) => false;
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Title'),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.person),
                    Text('Person 1'),
                  ],
                ),
                CustomPaint(
                  painter: CustomLinePainter(),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.person),
                    Text('Person 2'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter text',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.backspace),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
