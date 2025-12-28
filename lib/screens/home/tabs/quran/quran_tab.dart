import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/app_router.dart';
import 'package:islami/core/cache_helper.dart';
import 'package:islami/core/styles.dart';
import 'package:islami/model/quran_resources.dart';
import 'package:islami/screens/home/tabs/quran/widgets/most_rescent_item.dart';
import 'package:islami/screens/home/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> mostRecentList = [];
  List<int> filteredIndexes = [];

  @override
  void initState() {
    super.initState();
    loadMostRecent();

    // show all suras initially
    filteredIndexes = List.generate(
      QuranResources.arabicAuranSuraList.length,
          (index) => index,
    );
  }

  // ================= RECENT =================
  void loadMostRecent() {
    mostRecentList = CacheHelper.getSurasList() ?? [];
    setState(() {});
  }

  // ================= SEARCH =================
  void searchSura(String query) {
    final text = query.toLowerCase();

    if (text.isEmpty) {
      filteredIndexes = List.generate(
        QuranResources.arabicAuranSuraList.length,
            (index) => index,
      );
    } else {
      filteredIndexes = [];

      for (int i = 0;
      i < QuranResources.arabicAuranSuraList.length;
      i++) {
        final english =
        QuranResources.englishQuranSurahList[i].toLowerCase();
        final arabic =
        QuranResources.arabicAuranSuraList[i];

        if (english.contains(text) || arabic.contains(query)) {
          filteredIndexes.add(i);
        }
      }
    }

    setState(() {});
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- SEARCH ----------
          TextField(
            cursorColor: AppColors.whiteColor,
            style: const TextStyle(color: AppColors.whiteColor),
            onChanged: searchSura,
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

          // ---------- MOST RECENT ----------
          if (mostRecentList.isNotEmpty) ...[
            Gap(height * 0.02),
            Text("Most Recently", style: AppStyles.bold16White),
            Gap(8),
            SizedBox(
              height: height * 0.19,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final suraIndex =
                  int.parse(mostRecentList[index]);
                  return MostRecentItem(index: suraIndex);
                },
                separatorBuilder: (_, __) =>
                    SizedBox(width: width * 0.04),
                itemCount: mostRecentList.length,
              ),
            ),
          ],

          Gap(height * 0.02),
          Text("Suras List", style: AppStyles.bold16White),

          // ---------- SURAS LIST ----------
          Expanded(
            child: ListView.separated(
              itemCount: filteredIndexes.length,
              itemBuilder: (context, index) {
                final suraIndex = filteredIndexes[index];

                return InkWell(
                  onTap: () async {
                    await CacheHelper.saveSurasList(suraIndex);
                    loadMostRecent();

                    GoRouter.of(context).push(
                      AppRouter.detailsScreen1,
                      extra: suraIndex,
                    );
                  },
                  child: SuraItemWidgets(index: suraIndex),
                );
              },
              separatorBuilder: (_, __) => const Divider(
                color: AppColors.whiteColor,
                thickness: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primaryColor),
    );
  }
}
