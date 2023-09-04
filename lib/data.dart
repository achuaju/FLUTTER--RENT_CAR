import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Car {
  String brand;
  String model;
  double price;
  String condition;
  List<String> images;

  Car(this.brand, this.model, this.price, this.condition, this.images);

  CollectionReference cars = FirebaseFirestore.instance.collection("cars");
}

List<Car> getCarList() {
  return <Car>[
    Car(
      "Toyota",
      "Fortuner",
      2580,
      "Weekly",
      [
        "assets/images/Fortuner.png",
        "assets/images/fo2.png",
        "assets/images/fo3.png",
      ],
    ),
    Car(
      "Maruti",
      "Swift",
      3580,
      "Monthly",
      [
        "assets/images/swift.png",
        "assets/images/sw3.png",
        "assets/images/sw4.png",
      ],
    ),
    Car(
      "Volkswagen",
      "Polo GT TSI",
      1100,
      "Daily",
      [
        "assets/images/polo.png",
        "assets/images/pl.png",
      ],
    ),
    Car(
      "Hundai",
      "Creta",
      2200,
      "Monthly",
      [
        "assets/images/creta.png",
        "assets/images/hu.png",
      ],
    ),
    Car(
      "Mahindra",
      "Thar",
      3400,
      "Weekly",
      [
        "assets/images/thar.png",
      ],
    ),
    Car(
      "Maruti",
      "Jimny",
      4200,
      "Weekly",
      [
        "assets/images/Jimny.png",
      ],
    ),
    Car(
      "Toyota",
      "Innova",
      2300,
      "Weekly",
      [
        "assets/images/2.png",
        "assets/images/in.png",
      ],
    ),
    Car(
      "Honda",
      "City",
      1450,
      "Weekly",
      [
        "assets/images/city.png",
        "assets/images/city2.png",
      ],
    ),
  ];
}

class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Hertz",
      174,
      "assets/images/hertz.png",
    ),
    Dealer(
      "Avis",
      126,
      "assets/images/avis.png",
    ),
    Dealer(
      "Tesla",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter(""),
    Filter(""),
    Filter(""),
  ];
}
