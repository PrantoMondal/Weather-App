import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_response.freezed.dart';
part 'current_weather_response.g.dart';

@freezed
abstract class CurrentWeatherResponse with _$CurrentWeatherResponse {
  const factory CurrentWeatherResponse({
    @JsonKey(name: 'coord') Coord? coord,
    @JsonKey(name: 'weather') @Default([]) List<Weather> weather,
    @JsonKey(name: 'base') @Default('') String base,
    @JsonKey(name: 'main') Main? main,
    @JsonKey(name: 'visibility') @Default(0) int visibility,
    @JsonKey(name: 'wind') Wind? wind,
    @JsonKey(name: 'clouds') Clouds? clouds,
    @JsonKey(name: 'dt') @Default(0) int dt,
    @JsonKey(name: 'sys') Sys? sys,
    @JsonKey(name: 'timezone') @Default(0) int timezone,
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'cod') @Default(0) int cod,
  }) = _CurrentWeatherResponse;

  factory CurrentWeatherResponse.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherResponseFromJson(json);
}

@freezed
abstract class Sys with _$Sys {
  const factory Sys({
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'sunrise') @Default(0) int sunrise,
    @JsonKey(name: 'sunset') @Default(0) int sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, Object?> json) => _$SysFromJson(json);
}

@freezed
abstract class Clouds with _$Clouds {
  const factory Clouds({@JsonKey(name: 'all') @Default(0) int all}) = _Clouds;

  factory Clouds.fromJson(Map<String, Object?> json) => _$CloudsFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({
    @JsonKey(name: 'speed') @Default(0) double speed,
    @JsonKey(name: 'deg') @Default(0) int deg,
  }) = _Wind;

  factory Wind.fromJson(Map<String, Object?> json) => _$WindFromJson(json);
}

@freezed
abstract class Main with _$Main {
  const factory Main({
    @JsonKey(name: 'temp') @Default(0.0) double temp,
    @JsonKey(name: 'feels_like') @Default(0.0) double feelsLike,
    @JsonKey(name: 'temp_min') @Default(0.0) double tempMin,
    @JsonKey(name: 'temp_max') @Default(0.0) double tempMax,
    @JsonKey(name: 'pressure') @Default(0) int pressure,
    @JsonKey(name: 'humidity') @Default(0) int humidity,
    @JsonKey(name: 'sea_level') @Default(0) int seaLevel,
    @JsonKey(name: 'grnd_level') @Default(0) int grndLevel,
  }) = _Main;

  factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
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
abstract class Coord with _$Coord {
  const factory Coord({
    @JsonKey(name: 'lon') @Default(0.0) double lon,
    @JsonKey(name: 'lat') @Default(0.0) double lat,
  }) = _Coord;

  factory Coord.fromJson(Map<String, Object?> json) => _$CoordFromJson(json);
}
