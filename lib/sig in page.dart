import 'package:flutter/material.dart';

import 'foodpie.dart';

class Foodpie2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
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
              Text("FoodPie", style: TextStyle(color: Colors.white,fontSize: 58,),),
              Text("Always give better food ever", style: TextStyle(color: Colors.yellow,fontSize: 13,),),
              SizedBox(width: 240,
                height: 180,),

              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0,color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  icon: CircleAvatar(child: Icon(Icons.person_pin),backgroundColor: Colors.transparent,),
                  labelText: 'Username',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0,color: Colors.white),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  icon: CircleAvatar(child: Icon(Icons.email_outlined),backgroundColor: Colors.transparent,),
                  labelText: 'email addres',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0,color: Colors.white),
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
                  child: Text('sing up',style: TextStyle(color: Colors.black,),),
                ),

              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext) =>
                    Foodpie()),
                );
              },
                  child: Text("Alredy have an account? login",style: TextStyle(color: Colors.black),)),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),

            ],
          ),
        ),
      ),
    );
  }
}
