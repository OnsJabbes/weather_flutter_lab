import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetails extends StatefulWidget {
  final String city;

  WeatherDetails(this.city);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  var weatherData;

  void getData(String city) {
    String apiKey =
        "6cd0cb035cabd858e8054ad690622e4e"; // Remplacez par votre clé API
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${city},tn&APPID=${apiKey}";

    http.get(Uri.parse(url)).then((response) {
      print(response.body);
      setState(() {
        weatherData = json.decode(response.body);
      });
    }).catchError((error) {
      print("Erreur lors de la récupération des données: $error");
    });
  }

  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la météo'),
      ),
      body: Center(
        child: weatherData == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: weatherData['list'].length,
                itemBuilder: (context, index) {
                  var date = DateTime.fromMillisecondsSinceEpoch(
                      weatherData['list'][index]['dt'] * 1000);
                  var formattedDate = DateFormat('E dd/MM/yyyy').format(date);
                  var temperature =
                      (weatherData['list'][index]['main']['temp'] - 273.15)
                          .toStringAsFixed(2);
                  var weatherMain =
                      weatherData['list'][index]['weather'][0]['main'];

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Text(
                          formattedDate[0],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                          'Date: $formattedDate  Temperature: $temperature °C  Weather: $weatherMain'),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
