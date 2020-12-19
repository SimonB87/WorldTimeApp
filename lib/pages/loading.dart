import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    Response response = await get("https://worldtimeapi.org/api/timezone/Europe/London");
    String myData = response.body;
    Map data = jsonDecode(myData);
    print(data);

    // - get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    //String offset = data['utc_offset'].substring(1,3);

    print(datetime);
    print(offset);

    //offset = offset.substring(1,3);

    //print(offset);

    // - create datetime object
    DateTime now = DateTime.parse(datetime);
    //now.add(Duration(hours: offset));
    print(now);

  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
