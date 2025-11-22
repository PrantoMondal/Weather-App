// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentWeatherResponse _$CurrentWeatherResponseFromJson(
  Map<String, dynamic> json,
) => _CurrentWeatherResponse(
  coord: json['coord'] == null
      ? null
      : Coord.fromJson(json['coord'] as Map<String, dynamic>),
  weather:
      (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  base: json['base'] as String? ?? '',
  main: json['main'] == null
      ? null
      : Main.fromJson(json['main'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num?)?.toInt() ?? 0,
  wind: json['wind'] == null
      ? null
      : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  clouds: json['clouds'] == null
      ? null
      : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  dt: (json['dt'] as num?)?.toInt() ?? 0,
  sys: json['sys'] == null
      ? null
      : Sys.fromJson(json['sys'] as Map<String, dynamic>),
  timezone: (json['timezone'] as num?)?.toInt() ?? 0,
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  cod: (json['cod'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CurrentWeatherResponseToJson(
  _CurrentWeatherResponse instance,
) => <String, dynamic>{
  'coord': instance.coord,
  'weather': instance.weather,
  'base': instance.base,
  'main': instance.main,
  'visibility': instance.visibility,
  'wind': instance.wind,
  'clouds': instance.clouds,
  'dt': instance.dt,
  'sys': instance.sys,
  'timezone': instance.timezone,
  'id': instance.id,
  'name': instance.name,
  'cod': instance.cod,
};

_Sys _$SysFromJson(Map<String, dynamic> json) => _Sys(
  type: (json['type'] as num?)?.toInt() ?? 0,
  id: (json['id'] as num?)?.toInt() ?? 0,
  country: json['country'] as String? ?? '',
  sunrise: (json['sunrise'] as num?)?.toInt() ?? 0,
  sunset: (json['sunset'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SysToJson(_Sys instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

_Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    _Clouds(all: (json['all'] as num?)?.toInt() ?? 0);

Map<String, dynamic> _$CloudsToJson(_Clouds instance) => <String, dynamic>{
  'all': instance.all,
};

_Wind _$WindFromJson(Map<String, dynamic> json) => _Wind(
  speed: (json['speed'] as num?)?.toDouble() ?? 0,
  deg: (json['deg'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$WindToJson(_Wind instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
};

_Main _$MainFromJson(Map<String, dynamic> json) => _Main(
  temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
  feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
  tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
  tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
  pressure: (json['pressure'] as num?)?.toInt() ?? 0,
  humidity: (json['humidity'] as num?)?.toInt() ?? 0,
  seaLevel: (json['sea_level'] as num?)?.toInt() ?? 0,
  grndLevel: (json['grnd_level'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MainToJson(_Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
};

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  id: (json['id'] as num?)?.toInt() ?? 0,
  main: json['main'] as String? ?? '',
  description: json['description'] as String? ?? '',
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

_Coord _$CoordFromJson(Map<String, dynamic> json) => _Coord(
  lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
  lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$CoordToJson(_Coord instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};
