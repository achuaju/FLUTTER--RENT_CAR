import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  TextEditingController _brandController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _conditionController = TextEditingController();

  File? _image;

  void _uploadImage() {
    // Implement image upload logic here.
    // This could involve opening the image picker and saving the selected image to '_image' variable.
    // You can use packages like 'image_picker' or 'file_picker' for image selection.
  }

  void _saveToFirestore() async {
    String brand = _brandController.text;
    String model = _modelController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String condition = _conditionController.text;

    // Save the data to Firebase Firestore
    try {
      await FirebaseFirestore.instance.collection('products').add({
        'brand': brand,
        'model': model,
        'price': price,
        'condition': condition,
        // Add other fields as needed, e.g., imageURL for the image URL.
      });
      print('Data saved to Firestore!');
    } catch (e) {
      print('Error saving data to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _brandController,
                decoration: InputDecoration(labelText: 'Brand'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'Model'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _conditionController,
                decoration: InputDecoration(labelText: 'Condition'),
              ),
              SizedBox(height: 16.0),
              _image == null
                  ? ElevatedButton(
                      onPressed: _uploadImage,
                      child: Text('Upload Image'),
                    )
                  : Image.file(
                      _image!,
                      height: 200.0,
                      width: 200.0,
                    ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveToFirestore,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
