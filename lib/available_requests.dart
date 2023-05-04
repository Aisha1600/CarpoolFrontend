import 'package:flutter/material.dart';

//integrate the /getAllRequests api here which is in requestcreated
class AvailableRequests extends StatelessWidget {
  AvailableRequests({Key? key});

  final List<Map<String, dynamic>> data = [
    {
      'image': 'https://picsum.photos/200/300',
      'from': 'Address 1',
      'to': 'Address 2',
      'price': 20,
    },
    {
      'image': 'https://picsum.photos/200/300',
      'from': 'Address 3',
      'to': 'Address 4',
      'price': 25,
    },
    {
      'image': 'https://picsum.photos/200/300',
      'from': 'Address 5',
      'to': 'Address 6',
      'price': 30,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            for (final item in data)
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                        image: DecorationImage(
                          image: NetworkImage(item['image']),
                          fit: BoxFit.cover,
                        ),
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
                          SizedBox(height: 16),
                          Text(
                            'Ride Amount: \$${item['price']}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        // Handle arrow icon click
                      },
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
