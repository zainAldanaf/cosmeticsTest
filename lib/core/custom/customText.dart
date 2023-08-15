import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:flutter/material.dart';

class boldText extends StatelessWidget {
  final String text;

  const boldText({required this.text, required FontWeight fontWeight, required int fontSize});
  @override
  Widget build(BuildContext context) {

    return Text(text,
      textAlign:TextAlign.center,
      style: TextStyle(fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'Bahij_TheSansArabic-Plain',
          color: Colors.black),
    );
  }
}

class titleText extends StatelessWidget {
  final String title;

  const titleText({required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign:TextAlign.center,
      style: TextStyle(fontSize: 15,
          fontWeight: FontWeight.normal,
          fontFamily: 'Bahij_TheSansArabic-Plain',
          color: Colors.blueGrey),);
    }
}

class SubTitleText extends StatelessWidget{
  final String subTitle;

  const SubTitleText({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
   return Text(
     subTitle,
     style: const TextStyle(fontSize: 17,
       color: AppColors.lightPink
     ),
   );
  }

}

class CustomText extends StatelessWidget {
  final String text;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  final TextAlign? textAlign;


  CustomText({required this.text,this.fontWeight,this.color,this.fontSize,this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(

      text,textAlign:textAlign,style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color),);
  }
}