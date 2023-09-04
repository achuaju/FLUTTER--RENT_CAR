import 'package:flutter/material.dart';
import 'package:untitled21/sig%20in%20page.dart';
import 'package:untitled21/vechilehome.dart';

import 'dart:ui';

import 'UI.dart';

class Vehicle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(

        title: Center(
          child: Text(
            "",
            style: TextStyle(color: Colors.pink),
          ),
        ),
        shadowColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("READY TO GO ", style: TextStyle(color: Colors.white,fontSize: 50,),),
              Text("somewhere ", style: TextStyle(color: Colors.black,fontSize: 25,),),
              Text("   FEEL FREE TO", style: TextStyle(color: Colors.black,fontSize: 26,),),
              Text("          DRIVE", style: TextStyle(color: Colors.black,fontSize: 45,),),
              Text("RENT A CAR                     ", style: TextStyle(color: Colors.white,fontSize: 25,),),

              SizedBox(width: 200,
                height: 150,),

              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  icon: CircleAvatar(child: Icon(Icons.person_pin),backgroundColor: Colors.transparent,),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  icon: CircleAvatar(child: Icon(Icons.key_outlined),backgroundColor: Colors.transparent,),
                  labelText: 'Password',
                ),
              ),

              SizedBox(height: 16.0),
              SizedBox(
                height: 40,
                width: 300,

                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,shape: StadiumBorder()),
                  child: Text('Login',style: TextStyle(color: Colors.black,),),
                ),

              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext) =>
                    home()),
                );
              },
                  child: Text("Dont't have an account? sign up now",style: TextStyle(color: Colors.black),)),

              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext) =>
                    Ui()),
                );
              },
                  child: Text(" sign up managing",style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }
}
