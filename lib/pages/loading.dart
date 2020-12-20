import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = jsonDecode(response.body);
    //print(data);

    // get properties from json
    String datetime = data['datetime'];
    String offsetOriginal = data['utc_offset'].substring(2,3);
    String offset = offsetOriginal;

    //edit offset value
    String offsetOver10 = data['utc_offset'].substring(1,2);
    if (offsetOver10 == "1") {
      offset = "1" + offset;
    }
    String offsetSign = data['utc_offset'].substring(0,1);
    if (offsetSign == "-") {
      offset = "-" + offset;
    }

    //print(datetime);
    //print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    if ( offsetOriginal != "0" ) {
      now = now.add(Duration(hours: int.parse(offset)));
    }
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}

