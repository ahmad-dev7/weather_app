import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/get_weather.dart';
import 'package:weather_app/screens/locations_screen.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

String url = 'https://api.openweathermap.org/data/2.5/weather?';
String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        instruction =
            'Seems like we are not able to fetch your location... \nMake sure your location is turned on.';
      });
    });
  }

  void getLocation() async {
    var weatherData = await WeatherModel().getweatherData();
    double temp = weatherData['main']['temp'] - 273.15;
    int id = weatherData['weather'][0]['id'];
    String cityName = weatherData['name'];
    String weather = weatherData['weather'][0]['description'];
    String iconCode = weatherData['weather'][0]['icon'];
    double windSpeed = weatherData['wind']['speed'];
    int humidity = weatherData['main']['humidity'];
    int sunriseTimeStamp = weatherData['sys']['sunrise'];
    int sunsetTimeStamp = weatherData['sys']['sunset'];
    DateTime sunriseTimeData =
        DateTime.fromMillisecondsSinceEpoch(sunriseTimeStamp * 1000);
    DateTime sunsetTimeData =
        DateTime.fromMillisecondsSinceEpoch(sunsetTimeStamp * 1000);
    String sunriseTime = DateFormat('hh:mm a').format(sunriseTimeData);
    String sunsetTime = DateFormat('hh:mm a').format(sunsetTimeData);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => LocationScreen(
              temp: temp,
              id: id,
              cityName: cityName,
              weather: weather,
              iconCode: iconCode,
              windSpeed: windSpeed,
              humidity: humidity,
              sunriseTime: sunriseTime,
              sunsetTime: sunsetTime,
            )),
      ),
    );
  }

  String instruction = 'Getting your location...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset('images/getting_location.gif'),
            ),
            Text(
              instruction,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
