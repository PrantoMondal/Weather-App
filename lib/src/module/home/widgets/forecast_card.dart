import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/app_colors.dart';
import 'package:weather_app/src/core/constants/app_textstyles.dart';

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
        color: Colors.black.withAlpha(80),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(day, style: kInter400W14S.copyWith(color: AppColors.white)),

          const SizedBox(height: 4),
          Text(time, style: kInter400W14S.copyWith(color: AppColors.white)),

          const SizedBox(height: 4),

          Image.network(iconUrl, width: 32, height: 32),
          const SizedBox(width: 6),
          Text(condition, style: kInter400W14S.copyWith(color: AppColors.white)),

          const SizedBox(height: 4),

          Text(temp, style: kInter400W14S.copyWith(color: AppColors.white)),
        ],
      ),
    );
  }
}
