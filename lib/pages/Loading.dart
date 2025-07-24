import 'package:flutter/material.dart';
import 'package:world_clock/services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void getWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata',url: 'Asia/Kolkata',countryCode: 'IN');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'countryCode': instance.countryCode,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }




  @override
  void initState () {
    super.initState();
    getWorldTime();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.deepPurple[700],
          size: 50.0,
        ),
      )
    );
  }
}
