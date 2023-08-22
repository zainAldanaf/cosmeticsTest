
import 'package:cosmeticstest/core/features/Providers/productsProvider/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constant/Images.dart';
import '../constant/colors.dart';
import '../features/Providers/productsProvider/ProductProvider.dart';

import 'customText.dart';

class CustomProductItem extends StatelessWidget{
  final Product product;
  double height;
  double width;
  CustomProductItem(this.product,this.width,this.height);
  List<Product> items =[];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productList = productProvider.items;


    return Container(
        width: 420,
        height: 380,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
                alignment: Alignment.centerRight,
                children: [
                  Row(children: [
                    Column(
                      children: [
                        Positioned(
                          top: 40,
                          left: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.yellow,
                              ),
                              child: Center(child: SvgPicture.asset(AppImages.vector)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 50,
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 5),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink,
                              ),

                              child: const Center(child: Text ("%20" ,textAlign: TextAlign.center,style: TextStyle(
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,)),
                              ),
                            ),
                          ),
                        ),
                      ],),

                    Center(child: Image.network(product.image , width: 55, height:55,)),
                  ],),
                ]),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: boldText(text: product.title, fontWeight: FontWeight.normal, fontSize: 5),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.price.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.pink,
                    ),
                  ),
                  const SizedBox(width: 5),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                product.rating.toString(),
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: AppColors.pink),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Container(
                width: 120,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    product.category.toString().split('.').last,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 5,),

                  ],
                ),
              ),
            )
          ],)
    );
  }
}
