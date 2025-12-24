import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/quran_resources.dart';

import '../widgets/sura_content.dart';

class SuraDetailsScreen extends StatefulWidget {
  final int index;
   SuraDetailsScreen({super.key, required this.index});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    //loadSuraFile(widget.index);
    if(verses.isEmpty){
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
              child: verses.isEmpty
              ?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,))
              :ListView.separated(
                padding:  EdgeInsets.only(top: height*0.02),
                  itemBuilder: (context,index){
                    return SuraContent(content: verses[index], index: index,);
                  },
                  separatorBuilder: (context,index){
                  return  SizedBox(height:height*0.02,);
                  },
                  itemCount: verses.length
              ),
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
      verses=lines;
      await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
   }
}
