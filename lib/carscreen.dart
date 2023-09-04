import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edite.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Dealership App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextFieldPage()),
            );
          },
          child: Text('Add Car Details'),
        ),
      ),
    );
  }
}
