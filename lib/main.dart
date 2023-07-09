import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather application',
        home: LoadingPage(),
      ),
    );

// https://api.openweathermap.org/data/2.5/forecast?id={city_id}&appid={api_key}

// This API call returns data of weather focast of 5 days.
// Will work on this in future.
// https://cdn.dribbble.com/users/6259454/screenshots/15661680/media/2633c0e8d7d38083d9b9c7d0b910a595.png
// Desigen refrence
