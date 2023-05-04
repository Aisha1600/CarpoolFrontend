import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RequestHistory extends StatelessWidget {
  RequestHistory({super.key});
  final List<Map<String, dynamic>> data = [
    {
      'from': 'Address 1',
      'to': 'Address 2',
      'time': '8.00 Am',
      'status': 'Expired'
    },
    {
      'from': 'Address 3',
      'to': 'Address 4',
      'time': '8.00 Am',
      'status': 'Expired'
    },
    {
      'from': 'Address 5',
      'to': 'Address 6',
      'time': '8.00 Am',
      'status': 'Expired'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF05998C),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Request history',
                style: TextStyle(
                  color: Color(0xFF05998C),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  for (final item in data)
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(8),
                                right: Radius.circular(0),
                              ),
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From: ${item['from']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'To: ${item['to']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Time: ${item['time']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Status: ${item['status']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
