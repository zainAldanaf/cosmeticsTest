
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/custom/customCard.dart';

class cartScreen extends StatefulWidget{
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: AppColors.lightGray2,
     body: Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
    width: 670, // Set the desired width
    height: 150, // Set the desired height
    child: CustomCard(),
    ),
    ),
    ),
   );
  }
}