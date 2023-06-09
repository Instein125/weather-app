import 'package:flutter/material.dart';

import '../presentation/colors_manager.dart';
import '../presentation/textstyle_manager.dart';

class ImageAndConditionWidget extends StatefulWidget {
  const ImageAndConditionWidget({
    super.key,
    required this.height,
    required this.temp,
    required this.condition,
    required this.iconName,
  });

  final double height;
  final String temp;
  final String condition;
  final String iconName;

  @override
  State<ImageAndConditionWidget> createState() =>
      _ImageAndConditionWidgetState();
}

class _ImageAndConditionWidgetState extends State<ImageAndConditionWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.25,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      // color: Colors.white,
      child: Row(
        children: [
          MainImage(imagePath: "assets/images/${widget.iconName}.png"),
          const Spacer(),
          TempConditionWidget(temp: widget.temp, condition: widget.condition),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
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
          height: 40,
        ),
        SizedBox(
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
              height: 150,
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
      width: 140,
      // color: Colors.red,
      // alignment: Alignment.bottomLeft,
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
              Container(
                height: 50,
                // color: Colors.red,
                child: OverflowBox(
                  maxHeight: 100,
                  maxWidth: 150,
                  child: Text(
                    condition,
                    // "Thunderstorm with heavy drizzle",
                    style: getTitleStyle(
                        color: ColorManager.titleTextColor, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
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
