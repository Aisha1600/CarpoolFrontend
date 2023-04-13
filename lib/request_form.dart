import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RequestForm extends StatefulWidget {
  RequestForm({Key? key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  String? _selectedGender;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _count--;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM d, yyy').format(_selectedDate);
    String formattedTime = DateFormat('hh:mm a')
        .format(DateTime(2023, 1, 1, _selectedTime.hour, _selectedTime.minute));

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Time',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Palanquin'),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Row(
                        children: [
                          //Text(),
                          Text(
                            "$formattedDate",
                            // "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
                            style: TextStyle(fontFamily: 'Palanquin'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => _selectTime(context),
                      child: Row(
                        children: [
                          //Text("Time: "),
                          Text(
                            "$formattedTime",
                            //"${_selectedTime.hour}:${_selectedTime.minute}",
                            style: TextStyle(fontFamily: 'Palanquin'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Seats Available',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Palanquin'),
              ),
              SizedBox(
                width: 40,
              ),
              IconButton(
                onPressed: _incrementCounter,
                icon: Icon(
                  Icons.add_circle,
                  color: Color(0xFF05998C),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  radius: 15,
                  child: Text(_count.toString()),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: _decrementCounter,
                icon: Icon(
                  Icons.remove_circle,
                  color: Color(0xFF05998C),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Preference',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Palanquin'),
              ),
              SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'male';
                  });
                },
                child: _buildOption('Male'),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'female';
                  });
                },
                child: _buildOption('Female'),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'none';
                  });
                },
                child: _buildOption('None'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String label) {
    bool isSelected = _selectedGender == label.toLowerCase();

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF05998C) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Text(
        label,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Palanquin'),
      ),
    );
  }
}
