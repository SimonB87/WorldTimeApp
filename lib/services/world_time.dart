import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String location; // location name for the UI
  String time; // time in location
  String flag; // flag for location
  String url; // location URL for API endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // make the request
    //Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
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

    // set the time property
    time = now.toString();
    //print(time);
  }

}
