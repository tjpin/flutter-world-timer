import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for ui
  String time; // time in location
  String flag; //country flag url
  String url; // api endpoint
  bool isDaytime;


  WorldTime ({
    this.location,
    this.url,
    this.flag,
});

  Future<void> getTime() async{

    try {
      Response response =  await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // collect datetime and offset

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = "Something Went Wrong 😢 Check your Connection.";
    }
  }
}
