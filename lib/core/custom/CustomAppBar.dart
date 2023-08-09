import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/AppText.dart';
import '../constant/colors.dart';
import 'CustomContainer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar(this.title);

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
   return AppBar(
     backgroundColor: AppColors.pink,
     elevation: 4,
     toolbarHeight: 100,
     title: Row( // Wrap the CustomContainer and title in a Row
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         CustomContainer(Icon(Icons.notifications_none, color: AppColors.black, size: 25)),
         SizedBox(width: 15,),
         CustomContainer(Icon(Icons.favorite_border, color: AppColors.black, size: 25)),
         SizedBox(width: 100), // Add some spacing between the elements
         Text(
           title,
           style: TextStyle(fontSize: 26),
         ),
       ],
     ),
   );
  }

}