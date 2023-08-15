import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonPink extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  CustomButtonPink({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary:AppColors.pink ,
          padding: EdgeInsets.symmetric(horizontal: 145, vertical: 12),),
        child: Text(text,style: TextStyle(color:Colors.white ,fontSize: 14 ),),
    );
  }
}

class CustomButtonLightpink extends StatelessWidget {

  final String text;
  final Function()? onPressed;

  CustomButtonLightpink({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
          style: ElevatedButton.styleFrom(primary: AppColors.lightPink,
          padding: EdgeInsets.symmetric(horizontal: 145, vertical: 12),),
        child: Text(text,
            style: TextStyle(color: Colors.white, fontSize: 14)));
  }
}

class CustomBackTextButton extends StatelessWidget{
   final Function()? onPressed;
   final String text;

   CustomBackTextButton({required this.text, this.onPressed});

   @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,
        child: const Text("رجوع",style: TextStyle(color: Colors.pink),),);
  }

}

class CustomMaterialButton extends StatelessWidget{

  final int currentTab;
  final Widget prefixIcon;
  final String title;
  final Function()? onPressed;

  const CustomMaterialButton({super.key, required this.currentTab, required this.prefixIcon, required this.title, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onPressed ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // prefixIcon: prefixIcon (color: currentTab == currentTab ?AppColors.pink : AppColors.lightGray),
          Text(title, style: TextStyle(
              color: currentTab == 0 ? AppColors.pink : AppColors.lightGray)),
        ],
      ),

    );
  }

}

class CustomFilterBtn extends StatelessWidget {

  final Widget prefixIcon;
  final Function()? onPressed;

  CustomFilterBtn({required this.prefixIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:  BoxDecoration(
          color: AppColors.lightPink, // Change the color as needed
          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        ),
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Center(
          child: IconButton(
            color: AppColors.white,
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(primary: Color(0xFFF59AA9),
              padding: EdgeInsets.symmetric(horizontal: 145, vertical: 12),),
            icon: prefixIcon,

          ),
        ),
      ),
    );
  }
}