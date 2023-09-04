import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'edite.dart';




class CarListScree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CarList(),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TextFieldPage()),
          );
        },
        child: Icon(Icons.add),
      ),
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
            var carId = snapshot.data!.docs[index].id;
            var carImages = carData['images'];
            var carBrand = carData['brand'];
            var carModel = carData['model'];
            var carCondition = carData['condition'];
            var carPrice = carData['price'];

            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Image.network(carImages.isNotEmpty ? carImages[0] : ''),
                title: Text('$carBrand $carModel'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Condition: $carCondition'),
                    Text('Price: $carPrice'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarEditScree(
                              carId: carId,
                              initialBrand: carBrand,
                              initialModel: carModel,
                              initialPrice: carPrice,
                              initialCondition: carCondition,
                            ),
                          ),
                        );
                      },
                      child: Text('Edit'),
                    ),
                    SizedBox(width: 1
                    ,height: 1,),
                    ElevatedButton( style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm Delete'),
                              content: Text('Are you sure you want to delete this car?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                                  child: Text('Cancel'),
                                ),
                                TextButton(style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple),
                                  onPressed: () {
                                    carsCollection.doc(carId).delete();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CarEditScree extends StatefulWidget {
  final String carId;
  final String initialBrand;
  final String initialModel;
  final double initialPrice;
  final String initialCondition;

  CarEditScree({
    required this.carId,
    required this.initialBrand,
    required this.initialModel,
    required this.initialPrice,
    required this.initialCondition,
  });

  @override
  _CarEditScreeState createState() => _CarEditScreeState();
}

class _CarEditScreeState extends State<CarEditScree> {
  late TextEditingController _brandController;
  late TextEditingController _modelController;
  late TextEditingController _priceController;
  late TextEditingController _conditionController;

  @override
  void initState() {
    super.initState();
    _brandController = TextEditingController(text: widget.initialBrand);
    _modelController = TextEditingController(text: widget.initialModel);
    _priceController = TextEditingController(text: widget.initialPrice.toString());
    _conditionController = TextEditingController(text: widget.initialCondition);
  }

  @override
  void dispose() {
    _brandController.dispose();
    _modelController.dispose();
    _priceController.dispose();
    _conditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _brandController, decoration: InputDecoration(labelText: 'Brand')),
            TextField(controller: _modelController, decoration: InputDecoration(labelText: 'Model')),
            TextField(controller: _conditionController, decoration: InputDecoration(labelText: 'Condition')),
            TextField(controller: _priceController, decoration: InputDecoration(labelText: 'Price')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final carsCollection = FirebaseFirestore.instance.collection('cars');
                await carsCollection.doc(widget.carId).update({
                  'brand': _brandController.text,
                  'model': _modelController.text,
                  'condition': _conditionController.text,
                  'price': double.parse(_priceController.text),
                });
                Navigator.pop(context);
              },style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _brandController = TextEditingController();
    TextEditingController _modelController = TextEditingController();
    TextEditingController _conditionController = TextEditingController();
    TextEditingController _priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add New Car')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _brandController, decoration: InputDecoration(labelText: 'Brand')),
            TextField(controller: _modelController, decoration: InputDecoration(labelText: 'Model')),
            TextField(controller: _conditionController, decoration: InputDecoration(labelText: 'Condition')),
            TextField(controller: _priceController, decoration: InputDecoration(labelText: 'Price')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextFieldPage()),
                );

              },style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
