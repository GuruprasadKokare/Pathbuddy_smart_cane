import 'package:flutter/material.dart';

import 'package:pathbuddy/widgets/home_widgets/Emergency-call/Emergency-call.dart';
import 'package:pathbuddy/widgets/home_widgets/Emergency-call/emergency-widget-3.dart';
import 'package:pathbuddy/widgets/home_widgets/Emergency-call/addcontact.dart';
import 'package:pathbuddy/widgets/home_widgets/Trafficdetect/s_detect.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          EmergencyCall(),
          S_detect(),
          // EmergencyScreen(),
          Emerge(),
        ],
      ),
    );
  }
}
