import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/screens/home/tabs/hadeth/widgets/hadeeth_item.dart';
class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Padding(
      padding:  EdgeInsets.only(bottom: height*.02),
      child: CarouselSlider(
        options: CarouselOptions(
            height: height*.66,
          aspectRatio: 313.34/618,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,


        ),

        items: List.generate(50, (index) => index+1,).map((index) {
        return HadeethItem(index: index,);


        }).toList(),
      ),
    );
  }
}
