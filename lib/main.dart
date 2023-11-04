import 'package:flutter/material.dart';
import 'weather_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Information'),
      ),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          var cityData = weatherData[index];
          return ListTile(
            title: Text(cityData['city']),
            subtitle: Text(
                'Temperature: ${cityData['temperature']}°C\nCondition: ${cityData['condition']}\nHumidity: ${cityData['humidity']}%\nWind Speed: ${cityData['windSpeed']} m/s'),
          );
        },
      ),
    );
  }
}
