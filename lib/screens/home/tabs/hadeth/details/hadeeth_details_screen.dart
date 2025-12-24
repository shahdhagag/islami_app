import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/hadeeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  final Hadeeth hadeeth;
  final int index;
  const HadethDetailsScreen({
    super.key,
    required this.hadeeth,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          "Hadith $index",
          style: AppStyles.bold20Primery,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.imgLift),
                Text(
                  hadeeth.title,
                  style: AppStyles.bold24Primery,
                ),
                Image.asset(AppAssets.imgRight),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: height * 0.02),
                child: Text(
                  hadeeth.content,
                  style: AppStyles.bold16White.copyWith(color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Image.asset(AppAssets.bottomDecoration),
          ],
        ),
      ),
    );
  }
}
