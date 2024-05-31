import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ta_capstone/presentation/pages/home_screen.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';

import '../../share/app_style/style.dart';


class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);

    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: bodyStyle,
        bodyPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
        imageAlignment: Alignment.bottomCenter,
        pageMargin: const EdgeInsets.only(top: 25, bottom: 15),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        imageFlex: 2);

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        _buildPageViewModel(
          title: "Explore wonokitri",
          body:
          "Explore Wonokitri, enjoy the attractions and natural views and experience like a local",
          imageName: 'On Boarding.png',
          pageDecoration: pageDecoration,
        ),
        _buildPageViewModel(
          title: 'Tour Packages',
          body:
          "Enjoy the tour packages that have been provided and enjoy your trip",
          imageName: 'On Boarding-1.png',
          pageDecoration: pageDecoration,
        ),
        _buildPageViewModel(
          title: "Enjoy your trip",
          body:
          " with natural and cultural tourism presented by the Wonokitri tourist village",
          imageName: 'On Boarding-2.png',
          footer: _buildFooter(context),
          pageDecoration: pageDecoration,
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Text('Back',
          style:
          TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF03AED2))),
      next: const Text('Next',
          style:
          TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF03AED2))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 5.0),
        activeColor: Color(0xFF03AED2),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  PageViewModel _buildPageViewModel({
    required String title,
    required String body,
    required String imageName,
    Widget? footer,
    required PageDecoration pageDecoration,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Image.asset('assets/images/$imageName'),
      footer: footer,
      decoration: pageDecoration,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 5.0,
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Handle Google Sign In
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: AppColors.Blue500),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 40,
                ),
                SizedBox(width: 8.0),
                const Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text(
                  '- or -',
                  textAlign: TextAlign.center,
                  style: titleMediumGrey,
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.to(() => HomeScreen());
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white), // Warna border
                  ),
                  child: Text(
                    'Continue as a guest',
                    style: titleMediumBlue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
