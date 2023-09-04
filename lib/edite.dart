import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'bookingviewpage.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController conditionController = TextEditingController();

  List<String> images = ["assets/images/default_car.png"];

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        images.add(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Add Car Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: brandController,
              decoration: InputDecoration(labelText: 'Brand'),
            ),
            TextFormField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextFormField(
              controller: conditionController,
              decoration: InputDecoration(labelText: 'Condition'),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                pickImage(); // Call this method to pick an image
              },
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                saveCarData();
              },
              child: Text('Save Car'),
            ),
            ElevatedButton.icon(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataViewPage()),
                );
              },
              icon: Icon(Icons.verified),
              label: Text("bookings"),
            ),
          ],
        ),
      ),
    );
  }

  void saveCarData() async {
    String brand = brandController.text;
    String model = modelController.text;
    double price = double.tryParse(priceController.text) ?? 0.0;
    String condition = conditionController.text;

    String imageUrl = await uploadImage(images.last);

    // Save the data to Firestore
    FirebaseFirestore.instance.collection('cars').add({
      'brand': brand,
      'model': model,
      'price': price,
      'condition': condition,
      'images': [imageUrl],
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Car data saved successfully!'),
      ));
      Navigator.pop(context);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to save car data.'),
      ));
    });
  }

  Future<String> uploadImage(String imagePath) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('car_images/${DateTime.now()}.png');

    UploadTask uploadTask = storageReference.putFile(File(imagePath));

    TaskSnapshot taskSnapshot = await uploadTask;

    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }
}
