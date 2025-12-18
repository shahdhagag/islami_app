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

  List<Widget> tabsList= [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedItemColor: AppColors.whiteColor,
              unselectedItemColor: AppColors.blackColor,
              // backgroundColor: AppColors.primaryColor,
              // type: BottomNavigationBarType.fixed,
              items: [
                buildBottomNavBarItem(
                  iconName: AppAssets.iconQuran,
                  label: "Quran",
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconHadeth,
                  label: "Hadeth",
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconSebha,
                  label: "Sebha",
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconRadio,
                  label: "Radio",
                ),
                buildBottomNavBarItem(
                  iconName: AppAssets.iconTime,
                  label: "Time",
                ),
              ],
            ),
          ),
          body: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.isalmiTop),
              Expanded(
                  child: tabsList[selectedIndex],
              )
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required String iconName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(iconName)),
      label: label,
    );
  }
}
