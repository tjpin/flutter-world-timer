import 'package:flutter/material.dart';
import 'package:world_timer/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setTime() async{

    WorldTime ins = WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments:  {
      'location': ins.location,
      'flag': ins.flag,
      'time': ins.time,
      'isDaytime': ins.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.blue[800],
          size: 70.0,
        ),
      ),
    );
  }
}
