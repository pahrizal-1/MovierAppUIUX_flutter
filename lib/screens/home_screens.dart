import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movieapp/components/masked_image.dart';
import 'package:movieapp/components/search_widget.dart';
import 'package:movieapp/models/movie.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    width: 166,
                    height: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    width: 166,
                    height: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'What would you\nlike to watch?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const SearchFieldWidget(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  SizedBox(
                    height: 39,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text(
                      "New movie ",
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 39,
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == newMovies.length) {
                          mask = Constants.kMaskFirstIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 39,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text(
                      "Upcoming movies ",
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirstIndex;
                        } else if (index == upcomingMovies.length) {
                          mask = Constants.kMaskFirstIndex;
                        } else {
                          mask = Constants.kMaskCenter;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Constants.kPinkColor, Constants.kGreenColor])),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        width: screenWidth,
        height: 92,
        borderRadius: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kWhiteColor.withOpacity(0.1),
              Constants.kWhiteColor.withOpacity(0.1),
            ]),
        border: 0,
        blur: 30,
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 4,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconHome,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconPlayOnTv,
                  ),
                ),
              ),
              Expanded(child: Text('')),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconCategories,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Constants.kIconDownload,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
