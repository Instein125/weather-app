import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';

import '../model/weather/current_data.dart';

class GlobalController extends GetxController {
  //variables to be observed
  late final RxBool _isLoading = true.obs;
  late final RxDouble _latitude = 0.0.obs;
  late final RxDouble _longitude = 0.0.obs;
  //creating instance for checking variables
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  late var currentDataList = <CurrentData>[].obs;
  var jsonString;
  //same as init state but for getx
  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading.isTrue) {
      getLocation();

      // getCurrentWeatherData(jsonString);
    }

    super.onInit();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      jsonString = await FetchWeather()
          .getWeatherData(_latitude.value, _longitude.value);
      _isLoading.value = false;

      await getCurrentWeatherData(jsonString);
      return value;
    });
  }

  getCurrentWeatherData(jsonString) {
    String dateToFilter = "2023-05-03";

    List<dynamic> filteredData = jsonString["data"].where((item) {
      String date =
          item["datetime"].split(":")[0]; // Get the date from datetime
      return date == dateToFilter;
    }).toList();

    currentDataList.value =
        filteredData.map((map) => CurrentData.fromMap(map)).toList();
  }

  getCurrentWeather() {
    return currentDataList;
  }

  //same as dispose state but for getx
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
