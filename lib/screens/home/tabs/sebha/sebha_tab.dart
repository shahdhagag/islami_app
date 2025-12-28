import 'package:flutter/material.dart';
import 'package:islami/core/styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zekrIndex = 0;
  double rotationAngle = 0;

  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  void onSebhaTap() {
    setState(() {
      counter++;
      rotationAngle += 0.12;

      if (counter == 33) {
        counter = 0;
        zekrIndex = (zekrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onSebhaTap,
        child: SizedBox(
          width: 300,
          height: 400,
          child: Stack(
            children: [
              //  Title
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  textAlign: TextAlign.center,
                  style: AppStyles.bold20white.copyWith(fontSize: 28),
                ),
              ),

              //  Sebha head
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/sebha_header.png',
                    width: 100,
                  ),
                ),
              ),

              // Sebha body
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Center(
                  child: Transform.rotate(
                    angle: rotationAngle,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/SebhaBody 1.png',
                      width: 280,
                    ),
                  ),
                ),
              ),

              //  Zekr
              Positioned(
                top: 210,
                left: 0,
                right: 0,
                child: Text(
                  azkar[zekrIndex],
                  textAlign: TextAlign.center,
                  style:
                  AppStyles.bold20white.copyWith(fontSize: 24),
                ),
              ),

              //  Counter
              Positioned(
                top: 255,
                left: 0,
                right: 0,
                child: Text(
                  counter.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
