import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'data.dart';

class CarListScreen extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  List<Car> carList = getCarList();

  void addNewCar(String brand, String model, double price, String condition,
      List<String> images) {
    Car newCar = Car(brand, model, price, condition, images);
    setState(() {
      carList.add(newCar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Dealer App'),
      ),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(carList[index].brand + " " + carList[index].model),
            // Display other car details as needed
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCarScreen(addNewCar)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddCarScreen extends StatefulWidget {
  final Function addNewCar;

  AddCarScreen(this.addNewCar);

  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController imagesController = TextEditingController();

  void _addCar() {
    String brand = brandController.text;
    String model = modelController.text;
    double price = double.parse(priceController.text);
    String condition = conditionController.text;
    List<String> images = imagesController.text.split(',');

    widget.addNewCar(brand, model, price, condition, images);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Car'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: brandController,
              decoration: InputDecoration(labelText: 'Brand'),
            ),
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: conditionController,
              decoration: InputDecoration(labelText: 'Condition'),
            ),
            TextField(
              controller: imagesController,
              decoration:
                  InputDecoration(labelText: 'Images (comma-separated)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addCar,
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
