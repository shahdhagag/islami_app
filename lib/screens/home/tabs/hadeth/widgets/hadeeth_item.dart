import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/app_router.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/hadeeth.dart';
import 'package:islami/model/hadeeth_details_args.dart';

import '../../../../../core/app_colors.dart';

class HadeethItem extends StatefulWidget {
  final int index;

  const HadeethItem({super.key, required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeeth? hadeeth;

  @override
  void initState() {
    super.initState();
    loadHadeethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: const DecorationImage(
          image: AssetImage("assets/images/HadithCardBackGround 1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: hadeeth == null
          ? const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      )
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: width * 0.02,
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/left_cornerhadeth.png",
                  width: width * 0.16,
                ),

                /// ✅ Expanded correctly placed
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.push(
                        AppRouter.hadeethDetailsScreen,
                        extra: HadeethDetailsArgs(
                          hadeeth: hadeeth!,
                          index: widget.index,
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02),
                      child: Text(
                        hadeeth!.title,
                        textAlign: TextAlign.center,
                        style: AppStyles.bold24black,
                      ),
                    ),
                  ),
                ),

                Image.asset(
                  "assets/images/right_cornerhadeth.png",
                  width: width * 0.16,
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: InkWell(
                onTap: (){
                  context.push(
                    AppRouter.hadeethDetailsScreen,
                    extra: HadeethDetailsArgs(
                      hadeeth: hadeeth!,
                      index: widget.index,
                    ),
                  );
                },
                child: Text(
                  hadeeth!.content,
                  textAlign: TextAlign.center,
                  style: AppStyles.bold16White
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
            ),
          ),

          Image.asset(
            "assets/images/Mosque-hadeth.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Future<void> loadHadeethFile(int index) async {
    try {
      final fileContent =
      await rootBundle.loadString('assets/files/hadeeth/h$index.txt');

      final firstLineBreak = fileContent.indexOf('\n');

      setState(() {
        hadeeth = Hadeeth(
          title: fileContent.substring(0, firstLineBreak),
          content: fileContent.substring(firstLineBreak + 1),
        );
      });
    } catch (e) {
      debugPrint('Error loading hadeeth $index: $e');
    }
  }
}
