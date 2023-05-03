import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class FetchWeather {
  DateTime todayDate = DateTime.now();

  Future getWeatherData(lat, lon) async {
    String startDate = DateFormat("yyyy-MM-dd").format(todayDate);
    String endDate = DateFormat("yyyy-MM-dd")
        .format(DateTime(todayDate.year, todayDate.month, todayDate.day + 7));
    var response =
        await http.get(Uri.parse(apiUrl(lat, lon, startDate, endDate)));
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
