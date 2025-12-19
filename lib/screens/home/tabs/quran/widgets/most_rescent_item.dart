import 'package:flutter/material.dart';

import '../../../../../core/app_assets.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/styles.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
      ),
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
              Text("Al-Anbiya",style: AppStyles.bold24black,),
              Text("الأنبياء",style: AppStyles.bold24black,),
              Text("112 Verses",style: AppStyles.bold14black,),
            ],
          ),
          Image.asset(AppAssets.mostRecentImg),

        ],
      ),
    );
  }
}
