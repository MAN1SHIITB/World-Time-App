import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations = [
    WorldTime(url:'Europe/London', location: 'London', flag: 'UK.png' ),
    WorldTime(url:'Europe/Berlin', location: 'Athens', flag: 'Greece.png' ),
    WorldTime(url:'Africa/Cairo', location: 'Cairo', flag: 'Kenya.png' ),
    WorldTime(url:'Africa/Nairobi', location: 'Nairobi', flag: 'Egypt.png' ),
    WorldTime(url:'America/Chicago', location: 'Chicago', flag: 'Germany.png' ),
    WorldTime(url:'America/New_York', location: 'New York', flag: 'USA.jpg' ),
    WorldTime(url:'Asia/Kolkata', location: 'Kolkata', flag: 'INDIA.png' ),
    WorldTime(url:'Asia/Seoul', location: 'Seoul', flag: 'South Korea.jpg' ),
    WorldTime(url:'Asia/Jakarta', location: 'Jakarta', flag: 'Indonesia.png'),
    WorldTime(url:'Asia/Singapore', location: 'Singapore', flag: 'Singapore.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,
    {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build function ran ");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text('Choose your location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(
                      locations[index].location,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
          }),
    );
  }
}
