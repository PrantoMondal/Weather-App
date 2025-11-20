import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionService {
  void init() async {
    print("PermissionService called");
    await requestLocationPermission();
  }

  Future<Position> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception("Location service is disabled.");

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission permanently denied.");
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await _saveLatLng(position.latitude, position.longitude);

    return position;
  }

  Future<void> _saveLatLng(double lat, double lng) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("lat", lat);
    await prefs.setDouble("lng", lng);
  }

  Future<({double? lat, double? lng})> getSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    return (lat: prefs.getDouble("lat"), lng: prefs.getDouble("lng"));
  }
}
