import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/models/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/colors.dart';

  class CustomCard extends StatelessWidget {
    final Cart cart;

  const CustomCard( this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 3,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.delete_outline, size: 32,color: AppColors.pink,),
            ),
            Column(
            children: [
              boldText(text: cart.image,fontWeight: FontWeight.bold,fontSize: 20,),
              SizedBox(height: 10,),
              Row(
                children: [
                  const SizedBox(width: 5),
                  SvgPicture.asset(AppImages.currency, width: 10,height: 10,),
                  const SizedBox(width: 5),
                  Text(
                    cart.price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.pink,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  const SizedBox(width: 5),
                  Text(
                    cart.city,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.location_on_outlined, color: AppColors.yellow,size: 16,),

                  const SizedBox(width: 5),
                  Text(
                    cart.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.gray,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.person_3_outlined, color: AppColors.yellow,size: 16,),
                ],
              ),

            ],
          ),
            SizedBox(width: 20,),
            Image.asset(cart.title , width: 90, height: 90,),

          ],
        ),
      ),
    );

  }
}