import 'package:carpoolfront/find_your_carpool.dart';
import 'package:carpoolfront/offer_carpool.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Select_Role extends StatefulWidget {
  const Select_Role({super.key});

  @override
  State<Select_Role> createState() => _Select_RoleState();
}

class _Select_RoleState extends State<Select_Role> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'How would you like to proceed?',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OfferCarpool()),
                  );
                },
                child: const Text('Offer Carpool'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindYourCarpool()),
                  );
                },
                child: const Text('Avail Carpool'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
