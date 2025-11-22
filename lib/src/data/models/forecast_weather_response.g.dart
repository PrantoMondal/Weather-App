// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastWeatherResponse _$ForecastWeatherResponseFromJson(
  Map<String, dynamic> json,
) => _ForecastWeatherResponse(
  cod: json['cod'] as String? ?? '',
  message: (json['message'] as num?)?.toInt() ?? 0,
  cnt: (json['cnt'] as num?)?.toInt() ?? 0,
  listData:
      (json['list'] as List<dynamic>?)
          ?.map((e) => ListData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  city: json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForecastWeatherResponseToJson(
  _ForecastWeatherResponse instance,
) => <String, dynamic>{
  'cod': instance.cod,
  'message': instance.message,
  'cnt': instance.cnt,
  'list': instance.listData,
  'city': instance.city,
};

_City _$CityFromJson(Map<String, dynamic> json) => _City(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  coord: json['coord'] == null
      ? null
      : Coord.fromJson(json['coord'] as Map<String, dynamic>),
  country: json['country'] as String? ?? '',
  population: (json['population'] as num?)?.toInt() ?? 0,
  timezone: (json['timezone'] as num?)?.toInt() ?? 0,
  sunrise: (json['sunrise'] as num?)?.toInt() ?? 0,
  sunset: (json['sunset'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CityToJson(_City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coord': instance.coord,
  'country': instance.country,
  'population': instance.population,
  'timezone': instance.timezone,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

_Coord _$CoordFromJson(Map<String, dynamic> json) => _Coord(
  lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
  lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$CoordToJson(_Coord instance) => <String, dynamic>{
  'lat': instance.lat,
  'lon': instance.lon,
};

_ListData _$ListDataFromJson(Map<String, dynamic> json) => _ListData(
  dt: (json['dt'] as num?)?.toInt() ?? 0,
  main: json['main'] == null
      ? null
      : Main.fromJson(json['main'] as Map<String, dynamic>),
  weather:
      (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  clouds: json['clouds'] == null
      ? null
      : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  wind: json['wind'] == null
      ? null
      : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num?)?.toInt() ?? 0,
  pop: (json['pop'] as num?)?.toInt() ?? 0,
  sys: json['sys'] == null
      ? null
      : Sys.fromJson(json['sys'] as Map<String, dynamic>),
  dtTxt: json['dt_txt'] as String? ?? '',
);

Map<String, dynamic> _$ListDataToJson(_ListData instance) => <String, dynamic>{
  'dt': instance.dt,
  'main': instance.main,
  'weather': instance.weather,
  'clouds': instance.clouds,
  'wind': instance.wind,
  'visibility': instance.visibility,
  'pop': instance.pop,
  'sys': instance.sys,
  'dt_txt': instance.dtTxt,
};

_Sys _$SysFromJson(Map<String, dynamic> json) =>
    _Sys(pod: json['pod'] as String? ?? '');

Map<String, dynamic> _$SysToJson(_Sys instance) => <String, dynamic>{
  'pod': instance.pod,
};

_Wind _$WindFromJson(Map<String, dynamic> json) => _Wind(
  speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
  deg: (json['deg'] as num?)?.toInt() ?? 0,
  gust: (json['gust'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$WindToJson(_Wind instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};

_Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    _Clouds(all: (json['all'] as num?)?.toInt() ?? 0);

Map<String, dynamic> _$CloudsToJson(_Clouds instance) => <String, dynamic>{
  'all': instance.all,
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

_Main _$MainFromJson(Map<String, dynamic> json) => _Main(
  temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
  feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
  tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
  tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
  pressure: (json['pressure'] as num?)?.toInt() ?? 0,
  seaLevel: (json['sea_level'] as num?)?.toInt() ?? 0,
  grndLevel: (json['grnd_level'] as num?)?.toInt() ?? 0,
  humidity: (json['humidity'] as num?)?.toInt() ?? 0,
  tempKf: (json['temp_kf'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MainToJson(_Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'sea_level': instance.seaLevel,
  'grnd_level': instance.grndLevel,
  'humidity': instance.humidity,
  'temp_kf': instance.tempKf,
};
