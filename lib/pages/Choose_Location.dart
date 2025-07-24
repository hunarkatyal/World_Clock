import 'package:flutter/material.dart';
import 'package:world_clock/services/WorldTime.dart';
import 'package:country_flags/country_flags.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [];

  void generateList () async {
    List<WorldTime> result = await generateWorldTimeList();
    setState(() {
      locations = result;
    });
    // print(locations[0].location);
  }

  @override
  void initState() {
    super.initState();
    generateList();
  }

  void updateTime (index)async {
    WorldTime instance = locations[index];
    await instance.getData();

    Navigator.pop(context, {
      'location': instance.location,
      'countryCode': instance.countryCode,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CountryFlag.fromCountryCode(locations[index].countryCode),
              ),
            );
          }
      ),
    );
  }
}