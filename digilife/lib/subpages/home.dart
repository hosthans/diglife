import 'package:flutter/material.dart';

// ignore: camel_case_types
class home_of_app extends StatefulWidget {
  const home_of_app({Key? key}) : super(key: key);

  @override
  State<home_of_app> createState() => _home_of_appState();
}

class _home_of_appState extends State<home_of_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
