import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/services/netwoerk_helper.dart';

String url = 'https://api.openweathermap.org/data/2.5/weather?';
String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';

class WeatherModel {
  Future<dynamic> getweatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
      url:
          '${url}lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey',
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
