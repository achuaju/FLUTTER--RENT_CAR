import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled21/Supra.dart';
class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _home();
}

class _home extends State<home> {
var k = Mywidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('REDY TO GO ', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Categories of Services', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),

                ),
                const SizedBox(height: 30)
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
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('avalible car', CupertinoIcons.car_detailed, Colors.blueAccent),
                  itemDashboard('booking ', CupertinoIcons.car_detailed, Colors.orange),
                  itemDashboard('select loction', CupertinoIcons.car_detailed, Colors.pink),
                  itemDashboard('payment', CupertinoIcons.car_detailed, Colors.green),
                  itemDashboard('shedule time', CupertinoIcons.car_detailed, Colors.red),
                  itemDashboard('check detils', CupertinoIcons.car_detailed, Colors.orange),

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