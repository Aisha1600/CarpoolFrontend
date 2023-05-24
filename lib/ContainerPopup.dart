import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/ride.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Rider.dart';

class ContainerStack extends StatefulWidget {
  final String role; // The string you want to pass

  ContainerStack({required this.role});

  @override
  _ContainerStackState createState() => _ContainerStackState();
}

class _ContainerStackState extends State<ContainerStack> {
  List<bool> _containerVisibility = [true, false, false, false];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _containerVisibility[1] = true;
      });
    });
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _containerVisibility[2] = true;
      });
    });
    Future.delayed(Duration(seconds: 9), () {
      setState(() {
        _containerVisibility[3] = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 93, 93, 93),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          onPressed: () async {
                            if (widget.role == 'carpooler') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Message'),
                                      content: Text(
                                          'Are your sure you want to proceed with the carpool?'),
                                      actions: [
                                        TextButton(
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close the dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Rider()),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            } else if (widget.role == 'offerer') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Message'),
                                      content: Text(
                                          'Are your sure you want to proceed with the carpool?'),
                                      actions: [
                                        TextButton(
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close the dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Ride()),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            }
                          })),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Message'),
                                    content: Text(
                                        'Are your sure you want to cancel your carpool offer?'),
                                    actions: [
                                      TextButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                      ),
                                      TextButton(
                                        child: Text('Yes'),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OfferCarpool()),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                });
                          })),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Visibility(
                  visible: _containerVisibility[1],
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Row(
                          children: const [
                            Text(
                              'Muhammed wants to carpool with you',
                              style: TextStyle(
                                color: Colors.black, // Will work,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(children: const [
                              Text(
                                'Pick Up',
                                style: TextStyle(
                                  color: Colors.black, // Will work,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Bahria Town',
                                style: TextStyle(
                                  color: Colors.black, // Will work,
                                  fontSize: 12,
                                  //fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(children: const [
                              Text(
                                'Drop off',
                                style: TextStyle(
                                    color: Colors.black, // Will work,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Karachi University',
                                style: TextStyle(
                                  color: Colors.black, // Will work,
                                  fontSize: 12,
                                  //fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _containerVisibility[1] = false;
                                });
                              },
                              child: const Text('Accept'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _containerVisibility[1] = false;
                                });
                              },
                              child: const Text('Reject'),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ])),
              Visibility(
                visible: _containerVisibility[2],
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Row(
                        children: const [
                          Text(
                            'Aisha wants to carpool with you',
                            style: TextStyle(
                              color: Colors.black, // Will work,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(children: const [
                            Text(
                              'Pick up',
                              style: TextStyle(
                                color: Colors.black, // Will work,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Dolmen Mall',
                              style: TextStyle(
                                color: Colors.black, // Will work,
                                fontSize: 12,
                                //fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(children: const [
                            Text(
                              'Drop off',
                              style: TextStyle(
                                color: Colors.black, // Will work,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Shahra e Faisal',
                              style: TextStyle(
                                color: Colors.black, // Will work,
                                fontSize: 12,
                                //fontWeight: FontWeight.bold),
                              ),
                            ),
                          ])
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _containerVisibility[2] = false;
                              });
                            },
                            child: const Text('Accept'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _containerVisibility[2] = false;
                              });
                            },
                            child: const Text('Reject'),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
              ),
              Visibility(
                visible: _containerVisibility[3],
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(children: [
                        Row(
                          children: const [
                            Text(
                              'Muhammed wants a pick up from\nTower 7, Bahria Town to Karachi University',
                              style: TextStyle(
                                color: Colors.black, // Will work,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                    color: Colors.black, // Will work,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '500',
                                  style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Time',
                                  style: TextStyle(
                                    color: Colors.black, // Will work,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '5:30 pm',
                                  style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _containerVisibility[3] = false;
                                });
                              },
                              child: const Text('Accept'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _containerVisibility[3] = false;
                                });
                              },
                              child: const Text('Reject'),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
