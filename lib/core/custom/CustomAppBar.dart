import 'package:cosmeticstest/presentation/favoriteScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/NavigationBarScreen/CategoryDetails/cart.dart';
import '../constant/AppText.dart';
import '../constant/colors.dart';
import 'CustomContainer.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar(this.title);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);}

class _CustomAppBarState extends State<CustomAppBar> {
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
          CustomContainer(Icon(Icons.notifications_none, color: AppColors.black, size: 25),45,45,AppColors.white,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoriteScreen()),
              );
              setState(() {

              });
            },),

          SizedBox(width: 15,),
          CustomContainer(Icon(Icons.favorite_border, color: AppColors.black, size: 25),45,45,AppColors.white,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoriteScreen()),
              );
              setState(() {

              });
            },),
          SizedBox(width: 100), // Add some spacing between the elements
          Text(
            widget.title,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar2(this.title);

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppColors.pink,
      automaticallyImplyLeading: false,
      title:
      Padding(
          padding: EdgeInsets.only(left: 15.0,top: 40.0),
          child:
          Row(
            children: [
              CustomContainer(
                  Icon(Icons.shopping_cart_outlined, color: AppColors.pink, size: 25),45,45,AppColors.white,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cartScreen()),
                  );

                },),
              SizedBox(width: 10,),
            ],)

      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0, top: 42.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              title,
              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

}