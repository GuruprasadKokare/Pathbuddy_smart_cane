import 'package:flutter/material.dart';
import 'package:pathbuddy/views/camera_view.dart';
import 'package:pathbuddy/widgets/home_widgets/Emergency-call/addcontact.dart';
import 'package:pathbuddy/widgets/home_widgets/emergency.dart';

class Emerge extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => EmergencyScreen()),
            );
          },
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 246, 143, 39),
                  Color.fromARGB(255, 228, 110, 110),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                      radius: 35,
                      child: Image.asset('assets/images/add_pic.png',
                          height: 40, width: 50),
                      backgroundColor: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                Expanded(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5),
                          child: Column(
                            children: [
                              Text("Add Emergency Contacts",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
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
