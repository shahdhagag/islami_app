import 'package:flutter/material.dart';
import 'package:islami/core/app_assets.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/screens/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami/screens/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.backgroundHadeth,
    AppAssets.backgroundSebha,
    AppAssets.backgroundRadio,
    AppAssets.backgroundTime,
  ];

  List<Widget> tabsList = const [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                buildBottomNavBarItem(
                  iconName: AppAssets.iconQuran,
                  label: "Quran",
                  index: 0,
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconHadeth,
                  label: "Hadeth",
                  index: 1,
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconSebha,
                  label: "Sebha",
                  index: 2,
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconRadio,
                  label: "Radio",
                  index: 3,
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconTime,
                  label: "Time",
                  index: 4,
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.isalmiTop,
                height: height * 0.16,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: tabsList[selectedIndex],
              ),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required String iconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackbgColor,
        ),
        child: ImageIcon(AssetImage(iconName)),
      )
          : ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
