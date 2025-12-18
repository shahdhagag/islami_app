import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_router.dart';
import 'package:islami/core/styles.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.titleStyle),
      body: "",
      image: Image.asset("assets/images/intro11.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyles.titleStyle),
      bodyWidget: Text(
        textAlign: TextAlign.center,
        "We Are Very Excited To Have You In Our Community",
        style: AppStyles.bodyStyle,
      ),
      image: Image.asset("assets/images/intro2.png"),

      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyles.titleStyle),

      bodyWidget: Text(
        textAlign: TextAlign.center,
        "Read, and your Lord is the Most Generous",
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro3.png"),

      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
    PageViewModel(
      titleWidget: Text("Bearish", style: AppStyles.titleStyle),
      bodyWidget: Text(
        textAlign: TextAlign.center,
        "Praise the name of your Lord, the Most High",
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro4.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio", style: AppStyles.titleStyle),
      bodyWidget: Text(
        textAlign: TextAlign.center,
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: AppStyles.bodyStyle,
      ),

      image: Image.asset("assets/images/intro5.png"),

      decoration: const PageDecoration(
        titleTextStyle: TextStyle(color: Colors.orange),
        bodyTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: AppColors.blackColor,
      showNextButton: true,
      globalHeader: Image.asset("assets/images/introTop.png"),
      bodyPadding: EdgeInsets.only(top: 266),
      back: Text("back",style: AppStyles.bodyStyle,),
      showBackButton: true,
      skip: Text("Skip",style: AppStyles.bodyStyle,),
      showSkipButton: true,
      onSkip: () {
        GoRouter.of(context).push(AppRouter.homeScreen);
        // On button pressed
      },
      dotsDecorator: DotsDecorator(
        color: AppColors.grayColor,
        activeColor: AppColors.primaryColor,
        activeSize: Size(18, 7),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.transparent,
          )
        ),
          activeShape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.transparent,
              )
          ),
      ),

      next: Text("Next",style: AppStyles.bodyStyle,),
      done: Text("Done",style: AppStyles.bodyStyle,),
      onDone: () {
        GoRouter.of(context).push(AppRouter.homeScreen);
        // On button pressed
      },
    );
  }
}
