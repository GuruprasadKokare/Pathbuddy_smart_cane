import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:pathbuddy/widgets/home_widgets/Emergency-call/addcontact.dart';

import 'numbers.dart' as globals;

class EmergencyCall extends StatelessWidget {
  // const PoliceEmergency({super.key});
  callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => EmergencyScreen(),
            //     ));
            // callNumber("7719830631");
            FlutterPhoneDirectCaller.callNumber(globals.emergencyNumber);
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
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 5),
                  child: CircleAvatar(
                    radius: 25,
                    child: Image.asset('assets/images/alert.png'),
                    backgroundColor: Colors.white.withOpacity(0.9),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Column(
                        children: [
                          Text("Activate Emergency",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Call for emergency ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal)),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 15),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("S O S",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0))),
                              ),
                            ),
                          ),
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
