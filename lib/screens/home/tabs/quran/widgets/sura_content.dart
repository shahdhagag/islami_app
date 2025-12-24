
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class SuraContent extends StatelessWidget {
  const SuraContent({super.key, required this.content, required this.index});
  final String content;
  final int index;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      padding:  EdgeInsets.symmetric(vertical: height*0.01),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: AppColors.primaryColor,
            width: 2
        ),
      ),
      child: Text("$content[${index+1}]",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );

  }
}
