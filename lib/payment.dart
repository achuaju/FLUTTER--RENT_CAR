import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'PROJEC.dart';
import 'package:firebase_core/firebase_core.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => _Booking();
}

class _Booking extends State<Booking> {
  CollectionReference fire = FirebaseFirestore.instance.collection('booking');

  void add() async {
    await fire.add({
      "name": anamecnt.text,
      "your age": banamecnt.text,
      "Mobile Number": dnamecnt.text,
      "Select your city": cnamecnt.text,
      "Save booking": gnamecnt,
    }).then((value) {
      print("Data added");
    });
  }

  var anamecnt = TextEditingController();
  var banamecnt = TextEditingController();
  var cnamecnt = TextEditingController();
  var dnamecnt = TextEditingController();
  var enamecnt = TextEditingController();
  var fnamecnt = TextEditingController();
  var gnamecnt = TextEditingController();
  final _carList = [
    "fortuner",
    "swift",
    "innova",
    "city",
    "civic",
    "jimny",
    "thar"
  ];

  String? _selectedval = "";

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
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {},
                      controller: anamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_add_alt_1_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Name",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {},
                      controller: banamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        labelText: "your age ",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: dnamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mobile_friendly_outlined),
                        border: OutlineInputBorder(),
                        labelText: "Mobile Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: cnamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: "Licence Number",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                        ),
                        items: _carList
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {},
                      )),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: cnamecnt,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: "Select your city",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        add();
                      },
                      child: Text("Save booking"),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), primary: Colors.transparent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PROJEC(),
                          ),
                        );
                      },
                      child: Text("payment"),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), primary: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
