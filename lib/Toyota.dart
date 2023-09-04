import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(
          child: Text(
            "",
            style: TextStyle(color: Colors.pinkAccent),
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
              Text("Coffee", style: TextStyle(color: Colors.pinkAccent,fontSize: 58,),),
              SizedBox(width: 240,
              height: 180,),
              Row(
                children: [
                  Text("Welcome back"),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Row(
                children: [
                 TextButton(onPressed: (){},
                      child: Text("Hide password",style: TextStyle(color: Colors.black),)),
                  SizedBox(width: 140),
                  TextButton(onPressed: (){},
                       child: Text("forget?",style: TextStyle(color: Colors.black),)),
                ],
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 40,
                width: 300,

                child: ElevatedButton(
                  onPressed: () {

                  },style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,shape: CircleBorder()),
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),

            ],
          ),
        ),
      ),
    );
  }
}
