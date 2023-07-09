import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/netwoerk_helper.dart';
import 'package:weather_app/utilities/constants.dart';

String url = 'https://api.openweathermap.org/data/2.5/find?';
String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';

class CitySearchDialog extends StatelessWidget {
  const CitySearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String cityName = '';

    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 29, 56, 63),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
        'Find weather of any city',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(boxShadow: KContainerShadow),
          child: TextField(
            onChanged: (value) => cityName = value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            decoration: KInputFieldDecoration,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          width: double.maxFinite,
          height: 65,
          decoration: BoxDecoration(
            boxShadow: KContainerShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ElevatedButton(
              onPressed: () async {
                final weatherData =
                    await NetworkHelper(url: '${url}q=$cityName&appid=$apiKey')
                        .getData();
                if (weatherData['count'] != 0) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  Future(
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CityScreen(weatherData: weatherData),
                      ),
                    ),
                  );
                } else {
                  print('erro');
                }
              },
              child: const Text(
                'Get Weather',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
