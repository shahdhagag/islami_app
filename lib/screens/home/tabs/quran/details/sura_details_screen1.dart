import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/screens/home/tabs/quran/widgets/sura_content1.dart';

import '../widgets/sura_content.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  final int index;
  SuraDetailsScreen1({super.key, required this.index});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String suraContent="";

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    //loadSuraFile(widget.index);
    if(suraContent.isEmpty){
      loadSuraFile(widget.index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSurahList[widget.index],
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
                Text(QuranResources.arabicAuranSuraList[widget.index],style: AppStyles.bold24Primery,),
                Image.asset(AppAssets.imgRight),
              ],
            ),
            Expanded(
              child: suraContent.isEmpty?
                  Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
              : SingleChildScrollView(child: SuraContent1(content: suraContent,))
            ),

            Image.asset(AppAssets.bottomDecoration)
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent=   await rootBundle.loadString('assets/files/quran/${index+1}.txt');
    List<String> lines= fileContent.split("\n");
    for(int i=0;i<lines.length;i++) {
      lines[i] += "[${i + 1}]";
    }
    suraContent=lines.join();
    await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
  }
}
