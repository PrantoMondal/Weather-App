import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionService extends GetxService {
  static PermissionService get to => Get.find();
  Future<void> init() async {
    try {
      await requestLocationPermission();
    } catch (e, st) {
      log("PermissionService.init error: $e\n$st");
    }
  }

  Future<Position> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      _showEnableLocationDialog();
      // Wait until GPS becomes enabled
      await for (final status in Geolocator.getServiceStatusStream()) {
        if (status == ServiceStatus.enabled) {
          break;
        }
      }
    }

    // Now request permission
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

  void _showEnableLocationDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Enable Location"),
        content: const Text(
          "Your location service is turned off. Please enable GPS to continue.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("OK"),
          ),
        ],
      ),
      barrierDismissible: false,
    );
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
