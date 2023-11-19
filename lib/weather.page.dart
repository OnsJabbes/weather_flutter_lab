import 'package:flutter/material.dart';
import 'weather_detail.page.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration:
                  InputDecoration(hintText: 'Entrer le nom de la ville'),
              onChanged: (text) {
                setState(() {
                  this.city = text;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherDetails(city),
                  ),
                );
              },
              child: Text('Obtenir la météo...'),
            ),
          ],
        ),
      ),
    );
  }
}
