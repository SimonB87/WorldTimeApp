import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  String location; // location name for the UI
  String time; // time in location
  String flag; // flag for location
  String url; // location URL for API endpoint
  bool isDaytime; //set to true if it is daytime, otherwise false

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url'); //'http://worldtimeapi.org/api/timezone/Europe/London'
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

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      if ( offsetOriginal != "0" ) {
        now = now.add(Duration(hours: int.parse(offset)));
      }

      // set the time property
      isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat.jm().format(now);
      //print(time);
    }
    catch (e) {
      print("caught error: $e");
      time = "could not get data";
    }
  }

}
