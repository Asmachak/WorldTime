import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location ;
  String time ='';
  String flag ; // url to an assets flag icon
  String url ;
  bool isDaytime = true ;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{

    try{
      // make the request
      String url1 = "http://worldtimeapi.org/api/timezone/$url" ;
      Response response = await get(Uri.parse(url1));
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1,3);
      //  print(dateTime);
      // print(offSet);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime); //convert it to a DateTime object
      now = now.add(Duration(hours: int.parse(offSet)));
      // print(now);

      //Set time property
      isDaytime = now.hour>6 && now.hour<20? true : false ;
      this.time = DateFormat.jm().format(now);
    }
    catch (e){
      print("an error was occured : $e");
      time = 'could not get time data';

    }


  }}




