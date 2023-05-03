class CurrentData {
  final String datetime;
  var temp;
  var rh;
  final String timestampLocal;
  final String timestampUtc;
  final String weatherDesc;
  final double windSpd;

  CurrentData({
    required this.datetime,
    required this.temp,
    required this.rh,
    required this.timestampLocal,
    required this.timestampUtc,
    required this.weatherDesc,
    required this.windSpd,
  });

  factory CurrentData.fromMap(Map<String, dynamic> map) {
    return CurrentData(
      datetime: map['datetime'],
      temp: map['temp'],
      rh: map['rh'],
      weatherDesc: map['weather']['description'],
      timestampLocal: map['timestamp_local'],
      timestampUtc: map['timestamp_utc'],
      windSpd: map['wind_spd'] ?? 0,
    );
  }
}
