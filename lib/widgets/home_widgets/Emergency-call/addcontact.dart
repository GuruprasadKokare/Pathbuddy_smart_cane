import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'numbers.dart' as globals;

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen>
    with TickerProviderStateMixin {
  final textController = TextEditingController();

  //Saving phoneNumber
  static const String NUM_KEY = "EmergencyNumber";
  late String emergencyNumber = "911";

  @override
  void dispose() {
    textController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  // Loads emergencyNumber before anything else loads up
  @override
  void initState() {
    loadEmergencyNumber();
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Wakelock.enable();
  }

  void loadEmergencyNumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var globals;
      globals.emergencyNumber = pref.getString(NUM_KEY) ??
          "911"; //Assigns emergencyNumber with the value behind NUM_KEY. If null, assigns "911"
    });
  }

  void updateEmergencyNumber(String textController) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    globals.emergencyNumber = textController;
    pref.setString(NUM_KEY, globals.emergencyNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Add Emergency Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: SafeArea(
                child: Center(
                  child: TextButton(
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Type in your Emergency Number',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 222, 0, 0)),
                                    ),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: textController,
                                      //obscureText: true,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: '+91 9988776655',
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        updateEmergencyNumber(
                                            textController.text);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Save',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                    child: Text(
                      "Add Emergency Contact",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 27, 27),
                          decoration: TextDecoration.none),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          // side: BorderSide(color: Colors.black),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(81, 158, 158, 158),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}
