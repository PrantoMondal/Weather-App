import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_response.freezed.dart';
part 'city_response.g.dart';

@freezed
abstract class CityResponse with _$CityResponse {
  const factory CityResponse({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(0.0) @JsonKey(name: 'lat') double lat,
    @Default(0.0) @JsonKey(name: 'lon') double lon,
    @Default('') @JsonKey(name: 'country') String country,
    @Default('') @JsonKey(name: 'state') String state,
  }) = _CityResponse;

  factory CityResponse.fromJson(Map<String, Object?> json) =>
      _$CityResponseFromJson(json);
}
