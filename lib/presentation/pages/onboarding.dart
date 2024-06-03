import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:ta_capstone/presentation/pages/navigation.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';

import '../../share/app_style/style.dart';

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.black,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.LightGreen500,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      imageAlignment: Alignment.bottomCenter,
      pageMargin: const EdgeInsets.only(top: 25, bottom: 15),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        _buildPageViewModel(
          title: "Jelajahi Wonokitri",
          body:
              "Jelajahi Wonokitri, nikmati atraksi dan pemandangan alam serta rasakan pengalaman seperti warga lokal",
          imageName: 'OnBoarding.png',
          pageDecoration: pageDecoration,
        ),
        _buildPageViewModel(
          title: 'Nikmati Kemudahan',
          body:
              "Nikmati paket wisata yang telah disediakan dan nikmati perjalanan Anda",
          imageName: 'OnBoarding-1.png',
          pageDecoration: pageDecoration,
        ),
        _buildPageViewModel(
          title: "Enjoy your trip",
          body:
              " Nikmati kemudahan dalam memesan paket wisata yang telah disediakan",
          imageName: 'OnBoarding-2.png',
          footer: _buildFooter(context),
          pageDecoration: pageDecoration,
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: Container(
        decoration: BoxDecoration(
          color: AppColors.LightGreen500,
          border: Border.all(
            color: AppColors.LightGreen500,
            width: 4.0,
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Optional: for rounded corners
        ),
        padding: EdgeInsets.all(8.0),
        // Optional: for some padding inside the border
        child: const Text(
          'Back',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.LightGrey100),
        ),
      ),
      next: Container(
        decoration: BoxDecoration(
          color: AppColors.LightGreen500,
          border: Border.all(
            color: AppColors.LightGreen500,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(8.0),
        // Optional: for some padding inside the border
        child: const Text(
          'Next',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.LightGrey100),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(15.0, 5.0),
        activeColor: AppColors.LightGreen500,
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
                  side: BorderSide(color: AppColors.LightGreen500),
                ),
                backgroundColor: Colors.white),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 40,
                ),
                SizedBox(width: 8.0),
                const Text(
                  'Login Dengan Google',
                  style: TextStyle(
                    color: AppColors.LightGreen500,
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
                    Get.to(() => NavigationView());
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                  ),
                  child: Text(
                    'Lanjutkan Sebagai Tamu',
                    style: labelLargeGreen,
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
