import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Location();

  Future<void> getCurrentLocation() async {
    //LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
