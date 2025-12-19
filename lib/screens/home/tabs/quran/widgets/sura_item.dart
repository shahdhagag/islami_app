import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/quran_resources.dart';
class SuraItemWidgets extends StatelessWidget {
  final int index;

  const SuraItemWidgets({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Row(
      spacing: width*0.06,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.frameImg),
            Text('${index+1}',style:AppStyles.bold20white,),

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.englishQuranSurahList[index],style: AppStyles.bold20white,),
            Text('${QuranResources.VersesNumberList[index]}Verses',style: AppStyles.bold14white,),

          ],
        ),
        Spacer(),
        Text(QuranResources.arabicAuranSuraList[index],style: AppStyles.bold16White,),



      ],
    );
  }
}

