import 'package:flutter/material.dart';

import '../presentation/colors_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
        ],
      ),
    );
  }
}
