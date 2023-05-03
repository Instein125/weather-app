import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/fetch_weather.dart';
import '../controller/global_controller.dart';
import '../pages/mainscreen.dart';
import '../presentation/colors_manager.dart';
import '../presentation/textstyle_manager.dart';

class ImageAndConditionWidget extends StatefulWidget {
  const ImageAndConditionWidget({
    super.key,
    required this.height,
    required this.temp,
    required this.condition,
  });

  final double height;
  final String temp;
  final String condition;

  @override
  State<ImageAndConditionWidget> createState() =>
      _ImageAndConditionWidgetState();
}

class _ImageAndConditionWidgetState extends State<ImageAndConditionWidget> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  void initState() {
    // TODO: implement initState
    var currentList = globalController.getCurrentWeather().value;
    print("hi i am current list");
    print(currentList);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.21,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
      // color: Colors.white,
      child: Row(
        children: [
          MainImage(imagePath: "assets/images/rani_with_sun.png"),
          const Spacer(),
          TempConditionWidget(temp: widget.temp, condition: widget.condition),
        ],
      ),
    );
  }
}

class MainImage extends StatelessWidget {
  String imagePath;
  MainImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          height: 50,
          width: 150,
          child: OverflowBox(
            maxHeight: 300,
            maxWidth: 220,
            // alignment: Alignment.center,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              height: 220,
            ),
          ),
        ),
      ],
    );
  }
}

class TempConditionWidget extends StatelessWidget {
  const TempConditionWidget({
    super.key,
    required this.temp,
    required this.condition,
  });

  final String temp;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      // color: Colors.red,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                temp,
                style: getTempStyle(color: ColorManager.titleTextColor),
              ),
              Text(
                condition,
                style: getTitleStyle(
                    color: ColorManager.titleTextColor, fontSize: 20),
              ),
            ],
          ),
          Positioned(
              right: 3,
              top: 7,
              child: Text(
                "°C",
                style: getTitleStyle(
                    color: ColorManager.titleTextColor, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
