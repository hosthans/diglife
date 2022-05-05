import 'dart:developer';

import 'package:digilife/subpages/settings.dart';
import 'package:flutter/material.dart';
import 'package:digilife/subpages/home.dart';
import 'package:digilife/subpages/settings.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const DigiApp());
}

class DigiApp extends StatelessWidget {
  const DigiApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigiLife',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        highlightColor: Colors.red,
          //https://www.geeksforgeeks.org/flutter-custom-bottom-navigation-bar/#:~:text=A%20bottom%20navigation%20bar%20is,is%20provided%20as%20the%20Scaffold.
      ),
      home: const homePage(title: 'DigiLife'),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  //custom NavBar
  int pageIndex = 0;
  final pages = [
    const home_of_app(),
    const settings(),
  ];

  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 147, 251, 255),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {  },

        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 147, 251, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){

            }, icon: const Icon(Icons.home)),
            IconButton(onPressed: (){

            }, icon: const Icon(Icons.settings))
          ],
        ),
      ),




      body: Container(
        child: IndexedStack(
          children: const <Widget>[
            home_of_app(),
            settings()
          ],
          index: _selectedIndex,
        ),
      ),










      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
        spaceBetweenChildren: 5,
        closeManually: false,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.route),
            onTap: (){
              log("Route");
            }
          ),
          SpeedDialChild(
            child: const Icon(Icons.time_to_leave),
              onTap: (){
                log("Time");
              }
          ),
          SpeedDialChild(
            child: const Icon(Icons.info),
              onTap: (){
                log("Info");
              }
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


}


