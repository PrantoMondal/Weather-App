import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/app_colors.dart';
import 'package:weather_app/src/core/constants/app_textstyles.dart';
import 'package:weather_app/src/module/home/controllers/home_controller.dart';

class CitySearchField extends StatelessWidget {
  final HomeController homeController;
  const CitySearchField({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: homeController.searchController,

      isFullScreen: true,
      viewHintText: "Search for a city...",

      builder: (context, searchController) {
        return IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => searchController.openView(),
          tooltip: "Search city",
        );
      },

      suggestionsBuilder: (context, searchController) async {
        final query = searchController.text.trim();

        if (query.isEmpty) {
          return [
            const ListTile(
              leading: Icon(Icons.map_sharp),
              title: Text("Start typing a city name"),
              subtitle: Text("e.g. Dhaka, Rajshahi, Mymensingh"),
            ),
          ];
        }

        final cities = await homeController.searchCities(query);

        if (cities.isEmpty) {
          return [
            const ListTile(
              leading: Icon(Icons.sentiment_dissatisfied),
              title: Text("No cities found"),
              subtitle: Text("Try a different spelling"),
            ),
          ];
        }

        return cities.map((city) {
          final subtitle = city.state.isNotEmpty
              ? "${city.state}, ${city.country}"
              : city.country;

          return ListTile(
            leading: const Icon(Icons.location_on, color: AppColors.lightBlue),
            title: Text(city.name, style: kInter700W16S),
            subtitle: Text(subtitle, style: kInter400W12S),
            onTap: () {
              searchController.closeView(city.name);
              homeController.getWeatherByCityName(cityName: city.name);
              homeController.getForecastByCityName(cityName: city.name);
            },
          );
        }).toList();
      },
    );
  }
}
