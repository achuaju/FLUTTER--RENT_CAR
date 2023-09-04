import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'book.dart';

class CarListScree1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarList(),
    );
  }
}

class CarList extends StatelessWidget {
  final CollectionReference carsCollection =
  FirebaseFirestore.instance.collection('cars');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: carsCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No cars available.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var carData =
            snapshot.data!.docs[index].data() as Map<String, dynamic>;
            var carImages = carData['images'];
            var carBrand = carData['brand'];
            var carModel = carData['model'];
            var carCondition = carData['condition'];
            var carPrice = carData['price'];

            return Card(
              elevation: 4, // Add elevation for a raised effect
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
              child: ListTile(
                contentPadding: EdgeInsets.all(20),
                leading: Image.network(carImages.isNotEmpty ? carImages[0] : ''),
                title: Text('$carBrand $carModel'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Condition: $carCondition'),
                    Text('Price: $carPrice'),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BookingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                  child: Text('Booking'),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
