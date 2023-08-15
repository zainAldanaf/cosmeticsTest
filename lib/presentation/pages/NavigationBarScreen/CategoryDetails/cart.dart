
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/CustomAppBar.dart';
import 'package:cosmeticstest/core/custom/CustomButton.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/models/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/AppText.dart';
import '../../../../core/constant/Images.dart';
import '../../../../core/custom/customCard.dart';

class cartScreen extends StatefulWidget{
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  final List<Cart> cart = [

    Cart(AppText.table3,AppImages.table3,AppText.name,"20",AppText.city),
    Cart(AppText.chairK,AppImages.chairK,AppText.name,"20",AppText.city),
    Cart(AppText.shoes_table,AppImages.shoes_table,AppText.name,"20",AppText.city),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppText.cart),
      backgroundColor: AppColors.lightGray2,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column( // Wrap both ListView.builder and Container in a Column
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return CustomCard(item);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 380,
                height: 50,
                color: AppColors.sky,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        SvgPicture.asset(AppImages.currency, width: 10,height: 10, color: AppColors.black,),
                        const SizedBox(width: 5),
                        Text(
                          "75",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 200,),

                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: boldText( text:AppText.total,fontSize: 18,fontWeight: FontWeight.normal, ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 37,),
              CustomButtonPink(text: AppText.addOrder,onPressed: (){}),
              SizedBox(height: 5,),
              CustomButtonLightpink(text: AppText.cleanCart,onPressed: (){}),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}