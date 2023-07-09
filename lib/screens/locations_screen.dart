import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/search_dialog.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    super.key,
    required this.temp,
    required this.id,
    required this.cityName,
    required this.weather,
    required this.iconCode,
    required this.windSpeed,
    required this.humidity,
    required this.sunriseTime,
    required this.sunsetTime,
  });

  final double temp;
  final int id;
  final String cityName;
  final String weather;
  final String iconCode;
  final double windSpeed;
  final int humidity;
  final String sunriseTime;
  final String sunsetTime;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String formattedDate = '';
  @override
  void initState() {
    super.initState();
    _formatDate();
  }

  void _formatDate() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('EEEE, d MMMM').format(now);
  }

  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pin_drop, size: 35),
        title: Text(widget.cityName, style: KAppBarTextStyle),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color.fromARGB(255, 12, 19, 77),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CitySearchDialog(); //Moved Search alert dialog in a seprate file
                  },
                );
              },
              icon: const FaIcon(
                FontAwesomeIcons.magnifyingGlassLocation,
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
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff15C2F5),
                    Color(0xff15C2F5),
                    Color(0xff1165F3),
                    Color(0xff1165F3),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                          KGetImage(widget.iconCode),
                          color: const Color.fromARGB(255, 70, 69, 69),
                          width: 275,
                        ),
                      ),
                      ClipRRect(
                          child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
                        child: Image.asset(
                          KGetImage(widget.iconCode),
                          width: 285,
                        ),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' ${widget.temp.toStringAsFixed(0)}',
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
                    widget.weather,
                    style: GoogleFonts.lateef(
                      fontSize: 35,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(128, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  KDetails(
                    titleText: '${widget.windSpeed.toString()} km/h',
                    hintText: 'Wind',
                    image: 'images/wind.png',
                  ),
                  KDetails(
                    titleText: '${widget.humidity}%',
                    hintText: 'Humidity',
                    image: 'images/humidity.png',
                    width: 45,
                  ),
                  KDetails(
                    titleText: widget.sunriseTime,
                    hintText: 'Sunrise',
                    image: 'images/sunrise.png',
                    width: 60,
                  ),
                  KDetails(
                    titleText: widget.sunsetTime,
                    hintText: 'Sunset',
                    image: 'images/sunset.png',
                    width: 60,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
