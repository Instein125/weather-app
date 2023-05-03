import 'weather.dart';

class Datum {
  double? appTemp;
  double? azimuth;
  int? clouds;
  String? datetime;
  double? dewpt;
  int? dhi;
  int? dni;
  double? elevAngle;
  int? ghi;
  dynamic hAngle;
  String? pod;
  double? precip;
  int? pres;
  String? revisionStatus;
  int? rh;
  int? slp;
  int? snow;
  int? solarRad;
  double? temp;
  String? timestampLocal;
  String? timestampUtc;
  int? ts;
  double? uv;
  int? vis;
  Weather? weather;
  int? windDir;
  double? windGustSpd;
  double? windSpd;

  Datum({
    this.appTemp,
    this.azimuth,
    this.clouds,
    this.datetime,
    this.dewpt,
    this.dhi,
    this.dni,
    this.elevAngle,
    this.ghi,
    this.hAngle,
    this.pod,
    this.precip,
    this.pres,
    this.revisionStatus,
    this.rh,
    this.slp,
    this.snow,
    this.solarRad,
    this.temp,
    this.timestampLocal,
    this.timestampUtc,
    this.ts,
    this.uv,
    this.vis,
    this.weather,
    this.windDir,
    this.windGustSpd,
    this.windSpd,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appTemp: (json['app_temp'] as num?)?.toDouble(),
        azimuth: (json['azimuth'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
        datetime: json['datetime'] as String?,
        dewpt: (json['dewpt'] as num?)?.toDouble(),
        dhi: json['dhi'] as int?,
        dni: json['dni'] as int?,
        elevAngle: (json['elev_angle'] as num?)?.toDouble(),
        ghi: json['ghi'] as int?,
        hAngle: json['h_angle'] as dynamic,
        pod: json['pod'] as String?,
        precip: (json['precip'] as num?)?.toDouble(),
        pres: json['pres'] as int?,
        revisionStatus: json['revision_status'] as String?,
        rh: json['rh'] as int?,
        slp: json['slp'] as int?,
        snow: json['snow'] as int?,
        solarRad: json['solar_rad'] as int?,
        temp: (json['temp'] as num?)?.toDouble(),
        timestampLocal: json['timestamp_local'] as String?,
        timestampUtc: json['timestamp_utc'] as String?,
        ts: json['ts'] as int?,
        uv: (json['uv'] as num?)?.toDouble(),
        vis: json['vis'] as int?,
        weather: json['weather'] == null
            ? null
            : Weather.fromJson(json['weather'] as Map<String, dynamic>),
        windDir: json['wind_dir'] as int?,
        windGustSpd: (json['wind_gust_spd'] as num?)?.toDouble(),
        windSpd: (json['wind_spd'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'app_temp': appTemp,
        'azimuth': azimuth,
        'clouds': clouds,
        'datetime': datetime,
        'dewpt': dewpt,
        'dhi': dhi,
        'dni': dni,
        'elev_angle': elevAngle,
        'ghi': ghi,
        'h_angle': hAngle,
        'pod': pod,
        'precip': precip,
        'pres': pres,
        'revision_status': revisionStatus,
        'rh': rh,
        'slp': slp,
        'snow': snow,
        'solar_rad': solarRad,
        'temp': temp,
        'timestamp_local': timestampLocal,
        'timestamp_utc': timestampUtc,
        'ts': ts,
        'uv': uv,
        'vis': vis,
        'weather': weather?.toJson(),
        'wind_dir': windDir,
        'wind_gust_spd': windGustSpd,
        'wind_spd': windSpd,
      };
}
