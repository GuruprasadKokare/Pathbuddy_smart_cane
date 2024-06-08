import 'dart:math';
import 'package:flutter/material.dart';

import 'package:pathbuddy/widgets/home_widgets/CustomCarousel.dart';
import 'package:pathbuddy/widgets/home_widgets/Emergency-call/addcontact.dart';
import 'package:pathbuddy/widgets/home_widgets/custom_appbar.dart';
import 'package:pathbuddy/widgets/home_widgets/emergency.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qIndex = 0;

  void getRandomQuote() {
    Random random = Random();

    setState(() {
      qIndex = random.nextInt(5);
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomAppBar(
                quoteIndex: qIndex,
                onTap: () {
                  getRandomQuote();
                },
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomCarousel(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Emergency",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Emergency(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Emergency Contact button",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    EmergencyScreen(), // Assuming this is the Emergency contact button widget
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
