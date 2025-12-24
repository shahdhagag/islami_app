import 'package:flutter/material.dart';

import '../../../../../core/app_assets.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/styles.dart';
import '../../../../../model/quran_resources.dart';

class MostRecentItem extends StatelessWidget {
  final int index;

  const MostRecentItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranSurahList[index],
                style: AppStyles.bold24black,
              ),
              Text(
                QuranResources.arabicAuranSuraList[index],
                style: AppStyles.bold24black,
              ),
              Text(
                "${QuranResources.VersesNumberList[index]} verses",
                style: AppStyles.bold16White.copyWith(color: AppColors.blackColor),
              ),
            ],
          ),
          Image.asset(AppAssets.mostRecentImg),
        ],
      ),
    );
  }
}
