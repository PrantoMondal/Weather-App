import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_weather_response.freezed.dart';
part 'forecast_weather_response.g.dart';

@freezed
abstract class ForecastWeatherResponse with _$ForecastWeatherResponse {
  const factory ForecastWeatherResponse({
    @JsonKey(name: 'cod') @Default('') String cod,
    @JsonKey(name: 'message') @Default(0) int message,
    @JsonKey(name: 'cnt') @Default(0) int cnt,
    @JsonKey(name: 'list') @Default([]) List<ListData> listData,
    @JsonKey(name: 'city') City? city,
  }) = _ForecastWeatherResponse;

  factory ForecastWeatherResponse.fromJson(Map<String, Object?> json) =>
      _$ForecastWeatherResponseFromJson(json);
}

@freezed
abstract class City with _$City {
  const factory City({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'coord') Coord? coord,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'population') @Default(0) int population,
    @JsonKey(name: 'timezone') @Default(0) int timezone,
    @JsonKey(name: 'sunrise') @Default(0) int sunrise,
    @JsonKey(name: 'sunset') @Default(0) int sunset,
  }) = _City;

  factory City.fromJson(Map<String, Object?> json) => _$CityFromJson(json);
}

@freezed
abstract class Coord with _$Coord {
  const factory Coord({
    @JsonKey(name: 'lat') @Default(0.0) double lat,
    @JsonKey(name: 'lon') @Default(0.0) double lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, Object?> json) => _$CoordFromJson(json);
}

@freezed
abstract class ListData with _$ListData {
  const factory ListData({
    @JsonKey(name: 'dt') @Default(0) int dt,
    @JsonKey(name: 'main') Main? main,
    @JsonKey(name: 'weather') @Default([]) List<Weather> weather,
    @JsonKey(name: 'clouds') Clouds? clouds,
    @JsonKey(name: 'wind') Wind? wind,
    @JsonKey(name: 'visibility') @Default(0) int visibility,
    @JsonKey(name: 'pop') @Default(0) int pop,
    @JsonKey(name: 'sys') Sys? sys,
    @JsonKey(name: 'dt_txt') @Default('') String dtTxt,
  }) = _ListData;

  factory ListData.fromJson(Map<String, Object?> json) => _$ListDataFromJson(json);
}

@freezed
abstract class Sys with _$Sys {
  const factory Sys({@JsonKey(name: 'pod') @Default('') String pod}) = _Sys;

  factory Sys.fromJson(Map<String, Object?> json) => _$SysFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({
    @JsonKey(name: 'speed') @Default(0.0) double speed,
    @JsonKey(name: 'deg') @Default(0) int deg,
    @JsonKey(name: 'gust') @Default(0.0) double gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, Object?> json) => _$WindFromJson(json);
}

@freezed
abstract class Clouds with _$Clouds {
  const factory Clouds({@JsonKey(name: 'all') @Default(0) int all}) = _Clouds;

  factory Clouds.fromJson(Map<String, Object?> json) => _$CloudsFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'main') @Default('') String main,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'icon') @Default('') String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) => _$WeatherFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    @JsonKey(name: 'temp') @Default(0.0) double temp,
    @JsonKey(name: 'feels_like') @Default(0.0) double feelsLike,
    @JsonKey(name: 'temp_min') @Default(0.0) double tempMin,
    @JsonKey(name: 'temp_max') @Default(0.0) double tempMax,
    @JsonKey(name: 'pressure') @Default(0) int pressure,
    @JsonKey(name: 'sea_level') @Default(0) int seaLevel,
    @JsonKey(name: 'grnd_level') @Default(0) int grndLevel,
    @JsonKey(name: 'humidity') @Default(0) int humidity,
    @JsonKey(name: 'temp_kf') @Default(0.0) double tempKf,
  }) = _Main;

  factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
}
