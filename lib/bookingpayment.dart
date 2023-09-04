import 'package:flutter/material.dart';

class BookingPage2 extends StatefulWidget {
  @override
  _BookingPage2State createState() => _BookingPage2State();
}

class _BookingPage2State extends State<BookingPage2> {
  bool _paymentSuccessful = false;

  void _processPayment() {
    // Simulate payment processing
    // You would integrate with actual payment APIs here

    // For demonstration purposes, let's assume payment is successful
    setState(() {
      _paymentSuccessful = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wal.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Car Booking'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Choose your payment method:',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Code to initiate Google Pay payment
                      _processPayment();
                    },
                    child: Text('Pay now'),
                  ),
                  SizedBox(height: 20),
                  _paymentSuccessful
                      ? Text(
                          'Payment Successful!',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ));
  }
}
