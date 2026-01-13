import 'package:geolocator/geolocator.dart';

class LocationController {
  static Future<Position> determinePosition() async {
    bool isServiceEnabled = false;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      // print('service is disabled');
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // print('Location permission deined');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // print('Deined forever, cannot get location data');
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    Position position = await Geolocator.getCurrentPosition(
      // desiredAccuracy: LocationAccuracy.bestForNavigation,
      // locationSettings: LocationSettings(accuracy: LocationAccuracy.medium),
    );
    return position;
  }
}
