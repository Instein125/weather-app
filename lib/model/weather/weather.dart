import 'datum.dart';

class Weather {
  String? cityId;
  String? cityName;
  String? countryCode;
  List<Datum>? data;
  double? lat;
  double? lon;
  List<String>? sources;
  String? stateCode;
  String? stationId;
  String? timezone;

  Weather({
    this.cityId,
    this.cityName,
    this.countryCode,
    this.data,
    this.lat,
    this.lon,
    this.sources,
    this.stateCode,
    this.stationId,
    this.timezone,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        cityId: json['city_id'] as String?,
        cityName: json['city_name'] as String?,
        countryCode: json['country_code'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        sources: json['sources'] as List<String>?,
        stateCode: json['state_code'] as String?,
        stationId: json['station_id'] as String?,
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'city_id': cityId,
        'city_name': cityName,
        'country_code': countryCode,
        'data': data?.map((e) => e.toJson()).toList(),
        'lat': lat,
        'lon': lon,
        'sources': sources,
        'state_code': stateCode,
        'station_id': stationId,
        'timezone': timezone,
      };
}
