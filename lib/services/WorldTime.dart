import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:world_clock/secrets.dart';

class WorldTime {
  String location;
  String time = 'loading...';
  // String flag;
  String url;
  String countryCode;
  bool isDayTime = true;

  WorldTime({required this.location, required this.url, required this.countryCode});

  factory WorldTime.fromJson(Map<String, dynamic> json) {
    String zoneName = json['zoneName'];

    String location = zoneName.split('/').last.replaceAll('_', ' ');

    String country = json['countryName'];
    String cCode = json['countryCode'];;

    return WorldTime(
      url: zoneName,
      location: location,
      countryCode: cCode,
    );
  }

  Future<void> getData() async{

    try {
      Response response = await get(Uri.parse(
        'http://api.timezonedb.com/v2.1/get-time-zone'
            '$apiKey'
            '&format=json'
            '&by=zone'
            '&zone=$url',
      ));
      Map data = jsonDecode(response.body);
      DateTime now = DateTime.parse(data['formatted']);
      // now = now.add (Duration(seconds: data['gmtOffset']));

      time = DateFormat.jm().format(now);
      print(time);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch (c) {
      time = 'error found: $c';
    }

  }



}

Future<List<WorldTime>> generateWorldTimeList() async {
  final response = await get(Uri.parse(
    'http://api.timezonedb.com/v2.1/list-time-zone'
        '$apiKey'
        '&format=json',
  ));

  // print (response.body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // print (data);
    List zones = data['zones'];
    // print (data['zones']);

    // Convert each zone to WorldTime object
    return zones.map((z) => WorldTime.fromJson(z)).toList();
  } else {
    throw Exception('Failed to load timezones');
  }
}

