import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    // simulate network request for a username

    String userName = await Future.delayed(
        Duration(seconds: 3),
        () {
            return "Yoshi";
    });
    String bio = await Future.delayed(
        Duration(seconds: 2),
        () {
          return "Yoshi bio";
        });
    print("$userName - $bio");
  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("built function ran");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
      ),
      body: Text("Hello there"),
    );
  }
}
