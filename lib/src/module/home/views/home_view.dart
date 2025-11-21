import 'package:flutter/material.dart';
import 'package:weather_app/src/core/base/base_view.dart';
import 'package:weather_app/src/module/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF86B3FF), Color(0xFFE9F3FF)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ---- MENU + COUNTRY ----
              Row(
                children: [
                  const Icon(Icons.menu, size: 26, color: Colors.black87),
                  const SizedBox(width: 15),
                  Text(
                    "Bangladesh",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // ---- DATE BADGE ----
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "10.10.25",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ---- TEMPERATURE SECTION ----
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "69.0",
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "°",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Sunny",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ---- DESCRIPTION ----
              Text(
                "controller.description",
                style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6)),
              ),

              const SizedBox(height: 25),

              // ---- HUMIDITY / WIND / VISIBILITY CARD ----
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _infoTile(Icons.water_drop, "48%", "Humidity"),
                    _verticalDivider(),
                    _infoTile(Icons.air, "4km/h", "Wind"),
                    _verticalDivider(),
                    _infoTile(Icons.visibility, "1.8km", "Visibility"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ---- FORECAST ----
              Expanded(
                child: ListView(
                  children: [
                    _forecastItem("21 Jan", "Sunny", "31/21°"),
                    _forecastItem("22 Jan", "Horizon", "29/21°"),
                    _forecastItem("23 Jan", "Party Cloud", "21/17°"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Widgets ----

  Widget _infoTile(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12)),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(height: 40, width: 1, color: Colors.white.withOpacity(0.4));
  }

  Widget _forecastItem(String day, String condition, String temp) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(day, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.wb_sunny, size: 18),
              const SizedBox(width: 6),
              Text(condition),
            ],
          ),
          const Spacer(),
          Text(temp, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
