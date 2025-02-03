import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainImgSlider extends StatefulWidget {
  

  PageController pageController = PageController();
  int currentIndex = 0;
  Timer? timer;
  bool isVisible = false;

  MainImgSlider({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.timer,
    required this.isVisible,
  });
  
  @override
  State<MainImgSlider> createState() => _MainImgSliderState();
}

class _MainImgSliderState extends State<MainImgSlider> {
  final List<String> images = [
    'assets/img/s_1.png', // Sample images
    'assets/img/s_eng.png', // Sample images
    'assets/img/s_3.png', // Sample images
  ];

  @override
  Widget build(BuildContext context) {
    return _mainSlider();
  }

  Widget _mainSlider() {
    return VisibilityDetector(
      key: Key('pager_view'),
      onVisibilityChanged: (info) {
        bool currentlyVisible = info.visibleFraction > 0.5;
        if (currentlyVisible && !widget.isVisible) {
          widget.isVisible = true;
          _startAutoScroll();
        } else if (!currentlyVisible) {
          widget.isVisible = false;
          widget.timer?.cancel();
        }
      },
      child: Stack(
        children: [
          _mainImgSlider(),
          _manualNavBackword(),
          _manualNavForward(),
          _dotsIndicator(),
        ],
      ),
    );
  }

  Widget _mainImgSlider() {
    return PageView.builder(
      controller: widget.pageController,
      itemCount: images.length,
      onPageChanged: (index) => setState(() => widget.currentIndex = index),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: 400, // Fixed height
              child: Image.asset(images[index], fit: BoxFit.fill),
            );
          },
        );
      },
    );
  }

  Widget _dotsIndicator() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(images.length, (index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  widget.currentIndex = index;
                  widget.pageController.jumpToPage(index);
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: widget.currentIndex == index ? 12 : 8,
                height: widget.currentIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                  widget.currentIndex == index ? Colors.yellow[700] : Colors.grey,
                ),
              ));
        }),
      ),
    );
  }

  Widget _manualNavForward() {
    return Positioned(
      right: 20,
      top: 180,
      child: _buildNavButton(Icons.arrow_forward, () {
        widget.currentIndex = ((widget.currentIndex + 1) % images.length) as int;
        widget.pageController.jumpToPage(widget.currentIndex);
      }),
    );
  }

  Widget _manualNavBackword() {
    return Positioned(
      left: 20,
      top: 180,
      child: _buildNavButton(Icons.arrow_back, () {
        widget.currentIndex = ((widget.currentIndex - 1) % images.length) as int;
        widget.pageController.jumpToPage(widget.currentIndex);
      }),
    );
  }

  Widget _buildNavButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }

  void _startAutoScroll() {
    widget.timer?.cancel(); // Stop any existing timer
    widget.timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (widget.isVisible) {
        widget.currentIndex = ((widget.currentIndex + 1) % images.length) as int;
        widget.pageController.animateToPage(
          widget.currentIndex,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
