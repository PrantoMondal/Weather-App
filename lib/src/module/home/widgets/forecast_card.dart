import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String day;
  final String time;
  final String condition;
  final String temp;
  final String iconUrl;

  const ForecastCard({
    super.key,
    required this.day,
    required this.time,
    required this.condition,
    required this.temp,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(day, style: const TextStyle(fontSize: 14)),

          const SizedBox(height: 4),
          Text(time, style: const TextStyle(fontSize: 14)),

          const SizedBox(height: 4),

          Image.network(iconUrl, width: 28, height: 28),
          const SizedBox(width: 6),
          Text(condition),

          const SizedBox(height: 4),

          Text(temp, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
