// import 'weather.dart';

// class CurrentWeatherData {
//   final CurrentData current;
//   CurrentWeatherData({required this.current});
//   factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
//       CurrentWeatherData(current: CurrentData.fromJson(json));
// }

// class CurrentData {
//   String? datetime;
//   int? rh;
//   double? temp;
//   String? timestampLocal;
//   String? timestampUtc;
//   Weather? weather;
//   double? windSpd;

//   CurrentData({
//     this.datetime,
//     this.rh,
//     this.temp,
//     this.timestampLocal,
//     this.timestampUtc,
//     this.weather,
//     this.windSpd,
//   });

//   factory CurrentData.fromJson(Map<String, dynamic> json) => CurrentData(
//         datetime: json['datetime'] as String?,
//         rh: json['rh'] as int?,
//         temp: (json['temp'] as num?)?.toDouble(),
//         timestampLocal: json['timestamp_local'] as String?,
//         timestampUtc: json['timestamp_utc'] as String?,
//         weather: json['weather'] == null
//             ? null
//             : Weather.fromJson(json['weather'] as Map<String, dynamic>),
//         windSpd: (json['wind_spd'] as num?)?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         'datetime': datetime,
//         'rh': rh,
//         'temp': temp,
//         'timestamp_local': timestampLocal,
//         'timestamp_utc': timestampUtc,
//         'weather': weather?.toJson(),
//         'wind_spd': windSpd,
//       };
// }
