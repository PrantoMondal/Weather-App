// city_search_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

      // Correct signature: async function returning Iterable<Widget>
      suggestionsBuilder: (context, searchController) async {
        final query = searchController.text.trim();

        // 1. Empty query
        if (query.isEmpty) {
          return [
            const ListTile(
              leading: Icon(Icons.history),
              title: Text("Start typing a city name"),
              subtitle: Text("e.g. Tokyo, New York, Paris"),
            ),
          ];
        }

        // 2. Less than 2 characters
        if (query.length < 2) {
          return [
            const ListTile(
              leading: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              title: Text("Keep typing..."),
            ),
          ];
        }

        // 3. Actual search
        final cities = await homeController.searchCities(query);

        // 4. No results
        if (cities.isEmpty) {
          return [
            const ListTile(
              leading: Icon(Icons.sentiment_dissatisfied),
              title: Text("No cities found"),
              subtitle: Text("Try a different spelling"),
            ),
          ];
        }

        // 5. Return city suggestions
        return cities.map((city) {
          final subtitle = city.state.isNotEmpty
              ? "${city.state}, ${city.country}"
              : city.country;

          return ListTile(
            leading: const Icon(Icons.location_on, color: Colors.blue),
            title: Text(city.name),
            subtitle: Text(subtitle),
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
