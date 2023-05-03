import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';
import '../presentation/colors_manager.dart';
import '../presentation/textstyle_manager.dart';

class PlaceInfoWidget extends StatefulWidget {
  const PlaceInfoWidget({super.key});

  @override
  State<PlaceInfoWidget> createState() => _PlaceInfoWidgetState();
}

class _PlaceInfoWidgetState extends State<PlaceInfoWidget> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  String? placeName;
  String? countryName;
  String? date;

  @override
  void initState() {
    // TODO: implement initState
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    setState(() {
      placeName = placemarks[0].locality;
      countryName = placemarks[0].country;
      date = DateFormat("MMMMEEEEd").format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeName != null ? '$placeName,' : "",
          style: getTitleStyle(color: ColorManager.titleTextColor),
        ),
        Text(
          countryName != null ? "$countryName" : "",
          style: getTitleStyle(color: ColorManager.titleTextColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$date",
          style: getDimTextStyle(color: ColorManager.lightTextColor),
        ),
      ],
    );
  }
}
