// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String mobileBackground = 'images/mobile_background_image.jpg';
String pcBackground = 'images/laptop_background_image.jpg';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
  color: Colors.white,
);

const kButtonTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.bold,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

Widget KIcons({IconData? icon, Function? onTap}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: TextButton(
      onPressed: onTap as void Function()?,
      child: Icon(
        icon,
        color: Colors.white,
        size: 45,
      ),
    ),
  );
}

String KWeatherCondition(temp) {
  String condition = '';
  temp >= 30
      ? condition = '🌤️'
      : temp >= 22
          ? condition = '⛅'
          : condition = '🥶';
  return condition;
}

String KGetImage(String code) {
  Map<String, String> imageMap = {
    '01d': 'images/clear_sky_day.png',
    '01n': 'images/clear_sky_night.png',
    '02d': 'images/partly_cloudy_day.png',
    '02n': 'images/partly_cloudy_night.png',
    '03d': 'images/scattered_cloud_day.png',
    '03n': 'images/scattered_cloud_night.png',
    '04d': 'images/scattered_cloud_day.png',
    '04n': 'images/scattered_cloud_night.png',
    '09d': 'images/rain.png',
    '09n': 'images/rain.png',
    '10d': 'images/rain.png',
    '10n': 'images/rain.png',
    '11d': 'images/thunderstorm_day.png',
    '11n': 'images/thunderstorm_night.png',
    '13d': 'images/snow_day.png',
    '13n': 'images/snow_night.png',
    '50d': 'images/mist.png',
    '50n': 'images/mist.png',
  };

  return imageMap[code] ?? 'images/thunderstorm_day.png';
}

Widget KDataContainer({required List<Widget> children}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.black,
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(135, 255, 255, 255),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    ),
  );
}

TextStyle KWeatherDataStyle = GoogleFonts.lato(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

TextStyle KHintTextStyle = GoogleFonts.abel(
    color: const Color.fromARGB(153, 255, 255, 255),
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5);

class KDetails extends StatelessWidget {
  const KDetails({
    super.key,
    this.width = 50,
    required this.titleText,
    required this.hintText,
    required this.image,
  });

  final String image;
  final String titleText;
  final String hintText;
  final double width;
  @override
  Widget build(BuildContext context) {
    return KDataContainer(
      children: [
        Image.asset(
          image,
          width: width,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titleText,
              style: KWeatherDataStyle,
            ),
            Text(
              hintText,
              style: KHintTextStyle,
            ),
          ],
        )
      ],
    );
  }
}

InputDecoration KInputFieldDecoration = const InputDecoration(
  filled: true,
  fillColor: Colors.white,
  // icon: Padding(
  //   padding: EdgeInsets.only(left: 10),
  //   child: FaIcon(
  //     FontAwesomeIcons.magnifyingGlassLocation,
  //     size: 35,
  //   ),
  // ),
  // iconColor: Color.fromARGB(255, 0, 157, 255),
  hintText: 'Search city name...',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);

List<BoxShadow>? KContainerShadow = [
  const BoxShadow(
    color: Color.fromARGB(201, 23, 23, 23),
    blurRadius: 50,
    spreadRadius: 2,
  )
];

TextStyle KAppBarTextStyle = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 32,
  color: Colors.white,
);
