import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Mi extends StatefulWidget {
   Mi({super.key});

  @override
  State<Mi> createState() => _Mi();
}

class _Mi extends State<Mi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Achu.v', style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Flutter Developer', style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                      color: Colors.white54
                  )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/Achu.jpg'),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),

          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200)
                  )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 60,
                mainAxisSpacing: 30,
                children: [Column(
                  children: [

                  ],
                ),Column(
                  children: [
                    Text("About me",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                    Text("Hi..! im ACHU v "
                        "flutter developer with a demonstrated history "
                        "of working in the infprmation technology and servies industry"),
                  ],
                ),
                  Column(
                    children: [
                      Text("My Contact",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                      Text("achuachuaju2@gmail.com"),
                      Text("8086664086"),
                      Text("calicut,kerala"),

                    ],
                  ),
                  Column(
                    children: [
                      Text("professional Experience",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                      Text("FLUTTER DEVELOPER (INTERN)"
                          "TECHNOLOGIES JULY 2023-PRESNT"
                          )
                    ],
                  ),
                  Column(
                    children: [
                      Text("SKILLS",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                      Text("FLUTTER FRAMEWORK"
                          "DART"
                          "FIREBASE"
                          "REST API"
                          "UI DESIGN"
                          "GIT")
                    ],
                  ),
                  Column(
                    children: [
                      Text("Education Background",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                      Text("GOVT Higher Secondary school mukkam kozhikode   "),
                      Text("PTM HSS KODIYATHUR"
                          "HIGH SCHOOL"),
                     

                      
                    ],
                  ),
                  Column(
                    children: [
                      Text("Project",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                      Text(".FIREBASE"),
                      Text("PROVIDER"),
                      Text("GOOGLE SIGN IN")
                      
                    ],
                  ),
                  Column(
                    children: [
                      Text("Languages",style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),),
                      Text("ENGLISH"),
                      Text("MALAYALAM"),
                      Text("HINDI")
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5
          )
        ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium)
      ],
    ),
  );
}

