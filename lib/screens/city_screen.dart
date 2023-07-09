import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key, this.weatherData});

  final dynamic weatherData;
  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    int unixTimestamp = widget.weatherData['list'][0]['dt'];
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    String formattedDateTime =
        DateFormat('hh:mm a EEE, MMM d, y').format(dateTime.toLocal());
    double temperature = widget.weatherData['list'][0]['main']['temp'] - 273;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff001c38),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_city, size: 35),
        ),
        title: Text(
            '${widget.weatherData['list'][0]['name']}, ${widget.weatherData['list'][0]['sys']['country']}',
            style: KAppBarTextStyle),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color.fromARGB(255, 1, 22, 203),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.pin_drop,
                size: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                      deviceWidth < 600 ? mobileBackground : pcBackground),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Opacity(
                          opacity: 0,
                          child: Image.asset(
                            KGetImage(
                                '${widget.weatherData['list'][0]['weather'][0]['icon']}'),
                            color: const Color.fromARGB(255, 70, 69, 69),
                            width: 300,
                          ),
                        ),
                        ClipRRect(
                            child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 2),
                          child: Image.asset(
                            KGetImage(
                                '${widget.weatherData['list'][0]['weather'][0]['icon']}'),
                            width: 285,
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          temperature.toStringAsFixed(0),
                          style: GoogleFonts.aclonica(
                            fontSize: 100,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\xB0',
                          style: GoogleFonts.abel(
                            color: const Color.fromARGB(86, 255, 255, 255),
                            fontSize: 100,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.weatherData['list'][0]['weather'][0]['description']}',
                      style: GoogleFonts.lateef(
                        fontSize: 35,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      formattedDateTime,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(200, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          backgroundColor: Colors.black,
                          height: 1.5,
                          wordSpacing: 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KDetails(
                    titleText:
                        '${widget.weatherData['list'][0]['wind']['speed']} km/h',
                    hintText: 'Wind',
                    image: 'images/wind.png',
                  ),
                  KDetails(
                    titleText:
                        '${widget.weatherData['list'][0]['main']['humidity']}%',
                    hintText: 'Humidity',
                    image: 'images/humidity.png',
                    width: 45,
                  ),
                  KDetails(
                    titleText:
                        '${widget.weatherData['list'][0]['clouds']['all']}%',
                    hintText: 'Cloudy',
                    image: 'images/sunset.png',
                    width: 60,
                  ),
                  KDetails(
                    titleText:
                        '${widget.weatherData['list'][0]['main']['pressure']} hPa',
                    hintText: 'Pressure',
                    image: 'images/pressure.png',
                    width: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
