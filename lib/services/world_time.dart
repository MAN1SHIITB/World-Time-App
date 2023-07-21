import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime
{
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.location,required this.flag, required this.url});

  Future<void> getTime() async {
    var site = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
  
  try{
  Response response= await get(site);
  Map data = jsonDecode(response.body);
  //print(data);

  //get prop frm data
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  //print(datetime);
  print(offset);
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset) ));
  //set the time prop
  isDaytime = now.hour > 6 && now.hour < 18.5 ? true : false;
  time = DateFormat.jm().format(now);
  }
  catch(e){
    print('***********caught the error and it is = $e  ***************');
    time = 'Sorry plz do check the location you have entred, it is Incorrect Location';
  }
}}


