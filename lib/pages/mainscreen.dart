// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/place_widget.dart';
import '/presentation/textstyle_manager.dart';
import '/controller/global_controller.dart';
import '../presentation/colors_manager.dart';

class MainScreen extends StatefulWidget {
  static const String route = "/mainScreen";

  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  String countryName = "Sweden";

  String placeName = "Stockholm";

  String date = "Tue, Jan 30";

  String temp = "35";

  String condition = "Rainy";

  int selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Obx(
        () => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorManager.backGroundColor1,
                        ColorManager.backGroundColor2
                      ],
                      stops: const [
                        0.5,
                        1
                      ]),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/search.png",
                            height: 40,
                          ),
                          Image.asset(
                            "assets/images/menu.png",
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.18,
                      width: double.infinity,
                      // color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      child: const PlaceInfoWidget(),
                    ),
                    Container(
                      height: height * 0.21,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 4),
                      // color: Colors.white,
                      child: Row(
                        children: [
                          MainImage(
                              imagePath: "assets/images/rani_with_sun.png"),
                          const Spacer(),
                          TempConditionWidget(temp: temp, condition: condition),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.34,
                      width: double.infinity,
                      // color: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      // color: Colors.white,
                      child: Column(
                        children: [
                          InfoConditionWidget(
                              imagePath: 'assets/images/rainfall.png',
                              title: 'Rainfall',
                              value: '3cm'),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoConditionWidget(
                              imagePath: 'assets/images/wind.png',
                              title: 'Wind',
                              value: '19km/h'),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoConditionWidget(
                              imagePath: 'assets/images/humidity.png',
                              title: 'Humidity',
                              value: '64%'),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.06,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      // color: Colors.white,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              changeIndex(0);
                            },
                            child: Text(
                              "Today",
                              style: selectedIndex == 0
                                  ? getTempStyle(
                                      color: ColorManager.titleTextColor,
                                      fontSize: 12)
                                  : getRegularStyle(
                                      color: ColorManager.lightTextColor,
                                      fontSize: 12),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              changeIndex(1);
                            },
                            child: Text(
                              "Tomorrow",
                              style: selectedIndex == 1
                                  ? getTempStyle(
                                      color: ColorManager.titleTextColor,
                                      fontSize: 12)
                                  : getRegularStyle(
                                      color: ColorManager.lightTextColor,
                                      fontSize: 12),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              changeIndex(2);
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Next seven days",
                                  style: selectedIndex == 2
                                      ? getTempStyle(
                                          color: ColorManager.titleTextColor,
                                          fontSize: 12)
                                      : getRegularStyle(
                                          color: ColorManager.lightTextColor,
                                          fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: selectedIndex == 2
                                      ? ColorManager.titleTextColor
                                      : ColorManager.lightTextColor,
                                  size: 11,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    )));
  }
}

class InfoConditionWidget extends StatelessWidget {
  String imagePath;
  String title;
  String value;
  InfoConditionWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white38),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: title != 'Humidity' ? 10 : 30,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: OverflowBox(
                    maxHeight: title != 'Humidity' ? 100 : 78,
                    maxWidth: 150,
                    alignment: Alignment.center,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: getTitleStyle(
              color: ColorManager.darkTextColor,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: getTitleStyle(
              color: ColorManager.darkTextColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
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

//image widget
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
