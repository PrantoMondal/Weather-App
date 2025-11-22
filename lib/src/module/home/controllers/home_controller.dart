import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/core/base/base_controller.dart';
import 'package:weather_app/src/core/constants/app_strings.dart';
import 'package:weather_app/src/core/utils/debouncer.dart';
import 'package:weather_app/src/data/local/preference_manager.dart';
import 'package:weather_app/src/data/models/city_response.dart';
import 'package:weather_app/src/data/models/current_weather_response.dart';
import 'package:weather_app/src/data/models/forecast_weather_response.dart';
import 'package:weather_app/src/data/remote/weather_remote_datasource.dart';
import 'package:weather_app/src/module/home/widgets/city_search_field.dart';

class HomeController extends BaseController {
  final PreferenceManager preferenceManager;
  final WeatherRemoteDataSource remoteDataSource;
  HomeController({required this.remoteDataSource, required this.preferenceManager});

  @override
  void onInit() {
    super.onInit();
    getTempUnit();
    getCurrentWeather();
    getForecastWeather();
  }

  Rx<CurrentWeatherResponse> weather = CurrentWeatherResponse().obs;
  Rx<ForecastWeatherResponse> forecast = ForecastWeatherResponse().obs;

  final SearchController searchController = SearchController();
  RxBool isLoading = true.obs;
  RxString tempUnit = AppStrings.tempUnitCelsius.obs;
  final RxList<CityResponse> cities = <CityResponse>[].obs;
  final _searchDebounce = Debouncer(const Duration(milliseconds: 500));

  void getTempUnit() async {
    final unit = await preferenceManager.getString(AppStrings.spTempUnit);

    tempUnit.value = unit.isEmpty ? AppStrings.tempUnitCelsius : unit;
  }

  void changeTempUnit() async {
    if (tempUnit.value == AppStrings.tempUnitCelsius) {
      tempUnit.value = AppStrings.tempUnitFahrenheit;
      await preferenceManager.setString(
        AppStrings.spTempUnit,
        AppStrings.tempUnitFahrenheit,
      );
    } else {
      tempUnit.value = AppStrings.tempUnitCelsius;
      await preferenceManager.setString(
        AppStrings.spTempUnit,
        AppStrings.tempUnitCelsius,
      );
    }
  }

  void openSearchView() {
    searchController.openView();
    searchController.clear();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void getCurrentWeather() async {
    final lat = await preferenceManager.getDouble(AppStrings.spLatitude);
    final long = await preferenceManager.getDouble(AppStrings.spLongitude);
    callDataService(
      remoteDataSource.getWeather(latitude: lat, longitude: long),
      onSuccess: (data) {
        weather.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  void getForecastWeather() async {
    final lat = await preferenceManager.getDouble(AppStrings.spLatitude);
    final long = await preferenceManager.getDouble(AppStrings.spLongitude);
    callDataService(
      remoteDataSource.getForecastWeather(latitude: lat, longitude: long),
      onSuccess: (data) {
        forecast.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  void getWeatherByCityName({required String cityName}) async {
    callDataService(
      remoteDataSource.getWeatherByCityName(cityName: cityName),
      onSuccess: (data) {
        weather.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  void getForecastByCityName({required String cityName}) async {
    callDataService(
      remoteDataSource.getForecastWeatherByCityName(cityName: cityName),
      onSuccess: (data) {
        forecast.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
      },
    );
  }

  Future<List<CityResponse>> searchCities(String query) async {
    if (query.trim().isEmpty) {
      cities.clear();
      return [];
    }

    _searchDebounce(() async {
      try {
        final results = await remoteDataSource.getCities(query: query.trim());
        cities.value = results;
      } catch (e) {
        cities.clear();
      }
    });

    return cities;
  }
}
