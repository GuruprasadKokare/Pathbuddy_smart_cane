import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:pathbuddy/views/camera_view.dart';

class S_detect extends StatelessWidget {
  // const PoliceEmergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraView()),
            );
          },
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 39, 246, 67),
                  Color.fromARGB(255, 15, 128, 0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/signal2.jpg',
                      height: 80, width: 100),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Column(
                        children: [
                          Text("Traffic signal detection",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Press button on stick 3 times ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal)),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       vertical: 7.0, horizontal: 15),
                          //   child: Container(
                          //     height: 40,
                          //     width: 100,
                          //     decoration: BoxDecoration(
                          //       color: Color.fromARGB(255, 255, 255, 255),
                          //       borderRadius: BorderRadius.circular(50),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
