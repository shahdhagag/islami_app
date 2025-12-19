import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_router.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/screens/home/tabs/quran/widgets/most_rescent_item.dart';
import 'package:islami/screens/home/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height*.01,
          children: [
            TextField(
              cursorColor: AppColors.whiteColor,
              style: TextStyle(color: AppColors.whiteColor),
              decoration: InputDecoration(
                hintText: "Sura Name",
                hintStyle: AppStyles.bold16White,
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.searchIcon),
                  color: AppColors.primaryColor,
                ),
                enabledBorder: buildDecorationBorder(),
                focusedBorder: buildDecorationBorder(),
              ),
            ),
            Text("Most Recently",style: AppStyles.bold16White,),
            SizedBox(
              height:height*0.16 ,
              child:ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return MostRecentItem();
                  },
                  separatorBuilder: (context, index){
                    return SizedBox(width:width*0.04);
                  },
                  itemCount: 10,
              ) ,
            ),
            Text("Suras List",style: AppStyles.bold16White,),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.detailsScreen,extra: index);
                        },
                          child: SuraItemWidgets(index: index,));
                    },
                    separatorBuilder: (context,index){
                      return Divider(
                        color: AppColors.whiteColor,
                        thickness: 2,
                        indent:width*0.06,
                        endIndent: width*0.06,
                      );
                    },
                    itemCount: QuranResources.arabicAuranSuraList.length,
                ),
            ),

          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: AppColors.primaryColor,
      ),
    );
  }

}



