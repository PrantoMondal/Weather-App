import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/base/base_view.dart';
import 'package:weather_app/src/core/constants/app_colors.dart';
import 'package:weather_app/src/core/constants/app_strings.dart';
import 'package:weather_app/src/core/constants/app_textstyles.dart';
import 'package:weather_app/src/core/constants/app_values.dart';
import 'package:weather_app/src/core/utils/helper_functions.dart';
import 'package:weather_app/src/module/home/controllers/home_controller.dart';
import 'package:weather_app/src/module/home/widgets/city_search_field.dart';
import 'package:weather_app/src/module/home/widgets/forecast_card.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      final feelsLikeTemp = controller.weather.value.main?.feelsLike ?? 0;
      final unit = controller.tempUnit.value;
      final tempString = HelperFunctions.formatTemperature(feelsLikeTemp, unit);
      final main = controller.weather.value.main;
      final minTemp = HelperFunctions.formatTemperature(main?.tempMin ?? 0, unit);
      final maxTemp = HelperFunctions.formatTemperature(main?.tempMax ?? 0, unit);
      final temp = HelperFunctions.formatTemperature(
        controller.weather.value.main?.temp ?? 0,
        unit,
      );
      final String iconCode = controller.weather.value.weather.isNotEmpty
          ? controller.weather.value.weather.first.icon
          : "01d";

      final String description = controller.weather.value.weather.isNotEmpty
          ? controller.weather.value.weather.first.main
          : "Loading...";

      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.lightBlue, AppColors.white],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getCurrentWeather();
            controller.getForecastWeather();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: AppValues.gap,
            ).copyWith(top: AppValues.container_50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppValues.gapXSmall,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.getCurrentWeather();
                        controller.getForecastWeather();
                      },
                      child: Icon(
                        Icons.pin_drop_outlined,
                        size: AppValues.icon_28,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${controller.weather.value.name}, ${controller.weather.value.sys?.country ?? ""}",
                      style: kInter500W18S,
                    ),
                    Spacer(),
                    CitySearchField(homeController: controller),
                    Switch(
                      value: controller.tempUnit.value == AppStrings.tempUnitCelsius,
                      activeTrackColor: AppColors.black,
                      activeThumbImage: AssetImage('assets/images/c.jpg'),
                      inactiveThumbImage: AssetImage('assets/images/f.jpg'),
                      onChanged: (val) {
                        controller.changeTempUnit();
                      },
                    ),
                  ],
                ),
                Image.network(
                  '${AppStrings.iconPrefix}$iconCode${AppStrings.iconSuffix}',
                  fit: BoxFit.cover,
                ),

                Text(temp, style: kInter700W20S.copyWith(fontSize: 80)),
                Text("Feels Like: $tempString | $description", style: kInter400W14S),
                Text("Minimum: $minTemp | Maximum: $maxTemp", style: kInter400W14S),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppValues.gap_4,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/16234/16234021.png',
                      height: 20,
                    ),
                    Text(
                      HelperFunctions.formatTime(
                        controller.weather.value.sys?.sunrise ?? 0,
                      ),
                      style: kInter400W14S,
                    ),
                    Text(" | ", style: kInter400W14S),
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/1852/1852617.png',
                      color: AppColors.black,
                      height: 20,
                    ),

                    Text(
                      HelperFunctions.formatTime(
                        controller.weather.value.sys?.sunset ?? 0,
                      ),
                      style: kInter400W14S,
                    ),
                  ],
                ),
                Text(
                  "Last Updated At: ${HelperFunctions.formatDateTime(controller.weather.value.dt)}",
                  style: kInter400W14S,
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _infoTile(
                        Icons.water_drop,
                        "${controller.weather.value.main?.humidity ?? 0} %",
                        "Humidity",
                      ),
                      _verticalDivider(),
                      _infoTile(
                        Icons.air,
                        "${controller.weather.value.wind?.speed ?? 0} km/h",
                        "Wind",
                      ),
                      _verticalDivider(),
                      _infoTile(
                        Icons.visibility,
                        "${controller.weather.value.visibility / 1000 ?? 0} km",
                        "Visibility",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppValues.gapXSmall),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Forecast", style: kInter700W20S),
                ),

                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.forecast.value.listData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = controller.forecast.value.listData[index];
                      final temp = HelperFunctions.formatTemperature(
                        item.main?.temp ?? 0,
                        unit,
                      );

                      return ForecastCard(
                        day: DateFormat('dd MMM').format(DateTime.parse(item.dtTxt)),
                        time: DateFormat('hh:mm a').format(DateTime.parse(item.dtTxt)),
                        condition: item.weather.first.main,
                        temp: temp,
                        iconUrl:
                            '${AppStrings.iconPrefix}${item.weather.first.icon}${AppStrings.iconSuffix}',
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10);
                    },
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _infoTile(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.white, size: 28),
        const SizedBox(height: 6),
        Text(
          value,
          style: kInter700W16S.copyWith(
            color: AppColors.white,
            fontSize: AppValues.fontSize_14,
          ),
        ),
        Text(label, style: kInter400W12S.copyWith(color: AppColors.white.withAlpha(200))),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(height: 40, width: 1, color: AppColors.white.withAlpha(700));
  }
}
