import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bookingpayment.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String pickupLocation = '';
  String selectedDate = '';
  String selectedTimeSlot = '';
  String endDate = '';
  String numberOfRiders = '';
  String car = '';

  void _addBookingToFirestore() async {
    try {
      await firestore.collection('bookings').add({
        'pickupLocation': pickupLocation,
        'selectedDate': selectedDate,
        'selectedTimeSlot': selectedTimeSlot,
        'endDate': endDate,
        'numberOfRiders': numberOfRiders,
        "car": car,
      });

      setState(() {
        pickupLocation = '';
        selectedDate = '';
        selectedTimeSlot = '';
        endDate = '';
        numberOfRiders = '';
        car = '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking successfully')),
      );
    } catch (e) {
      print('Error adding booking: $e');
    }

  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car  Booking'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Pickup Location'),
              onChanged: (value) {
                setState(() {
                  pickupLocation = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              child: Text('Select Date'),
            ),
            Text('Selected Date: $selectedDate'),
            TextField(
              decoration: InputDecoration(labelText: 'Selected Time Slot'),
              onChanged: (value) {
                setState(() {
                  selectedTimeSlot = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'End Date'),
              onChanged: (value) {
                setState(() {
                  endDate = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name of Riders'),
              onChanged: (value) {
                setState(() {
                  numberOfRiders = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name of car'),
              onChanged: (value) {
                setState(() {
                  car = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addBookingToFirestore();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BookingPage2(),
                  ),
                );
              },
              child: Text('Book Now'),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
