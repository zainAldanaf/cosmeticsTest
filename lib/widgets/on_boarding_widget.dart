
import 'dart:async';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class onBoardingwidget extends StatelessWidget {

  String? title;
  String? description;
  String? img;

  onBoardingwidget(this.title, this.description, this.img);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.lightPink,
     body:
      Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        AspectRatio(
          aspectRatio: 12 / 9,
          child: SvgPicture.asset(
           img ?? '',
            fit: BoxFit.contain,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: boldText(
            text: title ?? '', fontWeight: FontWeight.bold, fontSize: 16,
          ),
        ),
        titleText(
          title:  description ?? '',
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
      ), );
  }
}