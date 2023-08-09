import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'HomeScreen.dart';
import 'add_piece.dart';
import 'categories.dart';
import 'more.dart';

class NavigationBarScreen extends StatefulWidget{
  @override
  State<NavigationBarScreen> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarScreen> {

  int currentTab = 3;
  final List<Widget> screen = [
    HomeScreen(),
    Categories(),
    AddPiece(),
    MoreItems()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:PageStorage(
          child: currentScreen,
           bucket: bucket,
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.notifications,),
       onPressed: (){

       },
       backgroundColor: AppColors.pink,
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar: BottomAppBar(
       shape: CircularNotchedRectangle(),
       notchMargin: 10,
       child: Container(
         height: 60,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             MaterialButton(
               minWidth: 40,
               onPressed: () {
                 setState(() {
                   currentScreen = MoreItems();
                   currentTab = 0;
                 });
               },
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.more_outlined, color: currentTab == 0 ?AppColors.pink : AppColors.lightGray),
                   Text(AppText.more, style: TextStyle(
                       color: currentTab == 0 ? AppColors.pink : AppColors.lightGray))
                 ],
               ),

             ),
             MaterialButton(
               minWidth: 40,
               onPressed: () {

                 setState(() {
                   currentScreen = AddPiece();
                   currentTab = 1;
                 });
               },
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.add_comment_outlined, color: currentTab == 1 ?AppColors.pink : AppColors.lightGray),
                   Text(AppText.addPiece, style: TextStyle(
                       color: currentTab == 1 ? AppColors.pink : AppColors.lightGray))
                 ],
               ),

             ),
             MaterialButton(
               minWidth: 40,
               onPressed: () {

                 setState(() {
                   currentScreen = Categories();
                   currentTab = 2;
                 });
               },
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.category_outlined, color: currentTab == 2 ? AppColors.pink : AppColors.lightGray),
                   Text(AppText.category, style: TextStyle(
                       color: currentTab == 2 ? AppColors.pink : AppColors.lightGray))
                 ],
               ),

             ),
             MaterialButton(
               minWidth: 40,
               onPressed: () {

                 setState(() {
                   currentScreen = HomeScreen();
                   currentTab = 3;
                 });
               },
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.home_outlined, color: currentTab == 3 ? AppColors.pink : AppColors.lightGray),
                   Text(AppText.home, style: TextStyle(
                       color: currentTab == 3 ? AppColors.pink : AppColors.lightGray))
                 ],
               ),

             ),
           ],
         ),
       ),
     ),

   );
  }
}