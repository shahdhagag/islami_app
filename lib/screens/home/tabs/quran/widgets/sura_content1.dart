
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class SuraContent1 extends StatelessWidget {
  const SuraContent1({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      padding:  EdgeInsets.symmetric(vertical: height*0.01),
      child: Text("$content",
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
