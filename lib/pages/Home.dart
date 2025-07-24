import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/${data['isDayTime'] ? 'day.png' : 'night.png'}',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result =
                      await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                  ),
                ),
                SizedBox(height: 370.0),
                Center(
                  child: Text(
                    '${data['location']}',
                    style: TextStyle(
                      fontSize: 50.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 100.0),
                Center(
                  child: Text(
                    '${data['time']}',
                    style: TextStyle(
                      fontSize: 60.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
