import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/quran_resources.dart';

class SuraDetailsScreen1 extends StatelessWidget {
  final int index;
  const SuraDetailsScreen1({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahList[index],
          style: AppStyles.bold20Primery,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.imgLift),
                Text(QuranResources.arabicAuranSuraList[index],style: AppStyles.bold24Primery,),
                Image.asset(AppAssets.imgRight),
              ],
            ),
            Expanded(
              child: Container(

              ),
            ),

            Image.asset(AppAssets.bottomDecoration)
          ],
        ),
      ),
    );
  }
}
