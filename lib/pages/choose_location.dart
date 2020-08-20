import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'KE.jpg'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'SA.png'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'Qr.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'EP.jpg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'UAE.jpg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'LDN.jpg'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'USA.jpg'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'NGr.jpg'),
    WorldTime(url: 'Africa/Tunis', location: 'Tunis', flag: 'TS.jpg'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'RS.jpg'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'CN.jpg'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los_Angeles', flag: 'USA.jpg'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'Riyadh.jpg'),
  ];

  void updateTime(index) async {

    WorldTime ins = locations[index];
    await ins.getTime();

    // Navigate to home screen
    Navigator.pop(context, {
      'location': ins.location,
      'flag': ins.flag,
      'time': ins.time,
      'isDaytime': ins.isDaytime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                ),
              ),
            ),
          );
          },
      ),
    );
  }
}
