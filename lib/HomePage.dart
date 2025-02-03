import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_team/about_us_and_out_value/OurValue.dart';
import 'package:smart_team/app_bar/CustomAppBar.dart';
import 'package:smart_team/main_slider/MainImgSlider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'about_us_and_out_value/AboutUs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;
  bool _isVisible = false;

  final List<String> images = [
    'assets/img/s_1.png', // Sample images
    'assets/img/s_eng.png', // Sample images
    'assets/img/s_3.png', // Sample images
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Smart Team',
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 460,
                child: MainImgSlider(
                  pageController: _pageController,
                  currentIndex: _currentIndex,
                  timer: _timer,
                  isVisible: _isVisible,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Wrap(
                spacing: 40,
                // Horizontal space between items
                runSpacing: 40,
                // Vertical space between items
                alignment: WrapAlignment.spaceBetween,

                children: [
                  AboutUsWidget(),
                  OurValueWedget(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                  child: Container(
                color: Color(0xFF252525),
                child: Center(child: Text("Hello", style: TextStyle(color: Colors.white))),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
