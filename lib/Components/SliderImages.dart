import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int activeIndex = 0;
final sliderImages = [
  "images/Sliderimages/slider1.png",
  "images/Sliderimages/slider5.jpg",
  "images/Sliderimages/silder7.jpg",
];
Widget buildImage(String urlImage, int index) => Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 50, bottom: 30),
              child: Text(
                "20% off on your\nFirst purchase",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        )
      ],
    );
Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: sliderImages.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Color(0xff6CC51D),
        dotColor: Colors.white,
        dotHeight: 6,
        dotWidth: 6,
      ),
    );
