import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pathbuddy/utils/quotes.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: List.generate(
              imagesliders.length,
              (index) => Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(imagesliders[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                    // child: Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Text(CardTitle[index],
                    //         style: TextStyle(
                    //           fontSize: MediaQuery.of(context).size.width / 20,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.white,
                    //         )),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
