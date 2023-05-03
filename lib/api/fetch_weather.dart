import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather/current_data.dart';
import '/model/weather/weather_data.dart';

class FetchWeather {
  Future getWeatherData(lat, lon) async {
    var response =
        await http.get(Uri.parse(apiUrl(lat, lon, "2023-05-03", "2023-05-06")));
    var jsonString = jsonDecode(response.body);
    return await jsonString;
  }
}

String apiUrl(lat, lon, startDate, endDate) {
  String url;
  url =
      "https://api.weatherbit.io/v2.0/history/hourly?lat=$lat&lon=$lon&start_date=$startDate&end_date=$endDate&tz=local&key=4060c330a7154ff1a8125e738decc5a9";
  return url;
}
