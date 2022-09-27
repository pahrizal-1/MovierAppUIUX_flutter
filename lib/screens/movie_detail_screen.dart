// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/constants.dart';

class MovieScreenDetail extends StatelessWidget {
  const MovieScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xff19191b),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/movie-posters/img-eternals.jpg'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3, color: Colors.white),
                      ),
                      child: SvgPicture.asset('assets/svg/icon-back.svg'),
                    ),
                    Container(
                      height: 44,
                      width: 44,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3, color: Colors.white),
                      ),
                      child: SvgPicture.asset('assets/svg/icon-menu.svg'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 9,
              top: screenHeight * 0.42,
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: const [Color(0xfffe53bb), Color(0xff09fbd3)],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Constants.kGreyColor),
                  child: Icon(
                    Icons.play_arrow,
                    color: Constants.kWhiteColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: screenHeight * 0.5,
                  transform:
                      Matrix4.translationValues(0, -screenHeight * 0.05, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.7,
                        child: Column(
                          children: [
                            Text(
                              'Etaelans',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Constants.kWhiteColor.withOpacity(0.85),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight <= 667 ? 10 : 20,
                            ),
                            Text(
                              '2021   Action-Adventure-Fantasy   2h36m',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Constants.kWhiteColor.withOpacity(0.85),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              itemSize: 14,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Constants.kYellowColor,
                              ),
                              onRatingUpdate: (rating) {
                                debugPrint(rating.toString());
                              },
                              unratedColor: Constants.kWhiteColor,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "The saga of the Eternals, a race of\n immortal beings who lived on Earth\n and shaped its history \nand civilizations.",
                              textAlign: TextAlign.center,
                              maxLines: 100,
                              style: TextStyle(
                                  color:
                                      Constants.kWhiteColor.withOpacity(0.75),
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
