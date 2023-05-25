import 'package:carpoolfront/Rider.dart';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:carpoolfront/ride.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'accept_carpool.dart';

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
        body: SingleChildScrollView(
            child: Padding(
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
                      child: Row(children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 70,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: ' Muhammad',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' wants to carpool with you.\n Pick Up from',
                                  ),
                                  TextSpan(
                                    text: " Tower 7, Bahria Town",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  \n Drop Off to ",
                                  ),
                                  TextSpan(
                                    text: " Karachi University",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ])),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(children: const [
                                  Text(
                                    'Date:',
                                    style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    ' 15 May',
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
                                    'Time:',
                                    style: TextStyle(
                                        color: Colors.black, // Will work,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    '2:45pm',
                                    style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            const SizedBox(
                              height: 10,
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _containerVisibility[1] = false;
                                    });
                                  },
                                  child: const Text('Reject'),
                                ),
                              ],
                            ),
                          ],
                        )
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
                    child: Row(children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 70,
                          ),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: ' Aisha',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' wants to carpool with you.\n Pick Up from',
                                  ),
                                  TextSpan(
                                    text: " Dolmen Mall",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  \n Drop Off to ",
                                  ),
                                  TextSpan(
                                    text: " Shahra e Faisal",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ])),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(children: const [
                                  Text(
                                    'Date:',
                                    style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    ' 15 May',
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
                                    'Time:',
                                    style: TextStyle(
                                        color: Colors.black, // Will work,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    '4:45pm',
                                    style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 12,
                                      //fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            const SizedBox(
                              height: 10,
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
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
                    child: Row(children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 70,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  children: [
                                TextSpan(
                                  text: ' Muhammad',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' wants to carpool with you.\n Pick Up from',
                                ),
                                TextSpan(
                                  text: " Tower 7, Bahria Town",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: "  \n Drop Off to ",
                                ),
                                TextSpan(
                                  text: " Karachi University",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(children: const [
                                Text(
                                  'Date:',
                                  style: TextStyle(
                                    color: Colors.black, // Will work,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  ' 15 May',
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
                                  'Time:',
                                  style: TextStyle(
                                      color: Colors.black, // Will work,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '2:45pm',
                                  style: TextStyle(
                                    color: Colors.black, // Will work,
                                    fontSize: 12,
                                    //fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ])
                            ],
                          ),
                          const SizedBox(
                            height: 10,
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _containerVisibility[1] = false;
                                  });
                                },
                                child: const Text('Reject'),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
              ),
            ],
          ),
        )));
  }
}
