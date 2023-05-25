import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RequestHistory extends StatelessWidget {
  RequestHistory({super.key});
  final List<Map<String, dynamic>> data = [
    {
      'from': 'I.I Churdrigarh Road',
      'to': 'Darakshan Villas',
      'time': '8.00 AM',
      'status': 'Expired'
    },
    {
      'from': 'North Nazimabad',
      'to': 'Lyari',
      'time': '10.00 AM',
      'status': 'Expired'
    },
    {
      'from': 'Shahra e Faisal',
      'to': 'Darakshan Villas',
      'time': '8.00 AM',
      'status': 'Expired'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6FFF0),
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: const Color(0xFF05998C),
        title: const Text('Request History'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
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
                                    fontWeight: FontWeight.bold,
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
