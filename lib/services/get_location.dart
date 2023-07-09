import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0.0;
  double longitude = 1.0;
  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.denied) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        latitude = position.latitude;
        longitude = position.longitude;
        print('lat: $latitude');
        print('lon: $longitude');
      } catch (e) {
        throw "Failed to fetch location $e";
      }
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        try {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
          latitude = position.latitude;
          longitude = position.longitude;
          print('lat: $latitude');
          print('lon: $longitude');
        } catch (e) {
          throw "Failed to fetch location $e";
        }
      } else {
        throw 'Location acess denied';
      }
      throw 'Location acess denied';
    }
  }
}
