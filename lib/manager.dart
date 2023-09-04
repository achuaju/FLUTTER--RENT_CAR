import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'PROJECT.dart';
import 'adding.dart';
import 'edite.dart';
import 'showroom.dart';

import 'carscreen.dart';
class Manage extends StatefulWidget {
  @override
  State<Manage> createState() => _Manage();//hi
}

class _Manage extends State<Manage> {
  String email = '';
  String password = '';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => CarListScree()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not found'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect password'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

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

          body:  SingleChildScrollView(
            child: Center(


              child: Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("READY TO GO ", style: TextStyle(color: Colors.white,fontSize: 50,),),
                  Text("somewhere ", style: TextStyle(color: Colors.black,fontSize: 25,),),
                  Text("   FEEL FREE TO", style: TextStyle(color: Colors.black,fontSize: 26,),),
                  Text("          DRIVE", style: TextStyle(color: Colors.black,fontSize: 45,),),
                  Text("RENT A CAR                     ", style: TextStyle(color: Colors.white,fontSize: 25,),),

                  SizedBox(width: 190,
                    height: 200,),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {},
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {},
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.remove_red_eye),
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: login,
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.black),
                      ),


                    ),


                  ),

                ],

              ),

            ),
          ),
        ),
      ),
    );
  }
}
