import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataViewPage extends StatefulWidget {
  @override
  _DataViewPageState createState() => _DataViewPageState();
}

class _DataViewPageState extends State<DataViewPage> {
  // Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to delete a booking
  void _deleteBooking(String documentId) {
    firestore.collection('bookings').doc(documentId).delete().then((_) {
      // Booking deleted successfully
      // You can add any additional logic here, such as showing a message.
    }).catchError((error) {
      // Handle errors if the deletion fails
      // You can also show an error message here.
      print("Error deleting booking: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder(
        stream: firestore.collection('bookings').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  documents[index].data() as Map<String, dynamic>;

              // Extract data from the document
              String pickupLocation = data['pickupLocation'];
              String selectedDate = data['selectedDate'];
              String timeSlot = data['selectedTimeSlot'];
              String endDate = data['endDate'];
              String riderName = data['numberOfRiders'];
              String car = data['car'];

              return ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/fire-5582b.appspot.com/o/car_images%2F2023-08-21%2022%3A21%3A01.691905.png?alt=media&token=07bf9483-91dc-4be9-a6f7-e168a78111eb"),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Pickup Location: $pickupLocation'),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Selected Date: $selectedDate'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Selected Time: $timeSlot'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('End Date: $endDate'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rider Name: $riderName'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Name of Car: $car'),
                    ),
                  ],
                ),
                trailing: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  onPressed: () {
                    // Call the delete function with the document ID
                    _deleteBooking(documents[index].id);
                  },
                  icon: Icon(Icons.delete),
                  label: Text("cancel booking"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
