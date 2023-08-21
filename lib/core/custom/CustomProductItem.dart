
import 'package:cosmeticstest/core/models/Products.dart';
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
        width: 170,
        height: 340,
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
                          top: 50,
                          left: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              width: 40,
                              height: 40,
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
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink,
                              ),

                              child: const Center(child: Text ("%20" ,textAlign: TextAlign.center,style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.normal,)),
                              ),
                            ),
                          ),
                        ),
                      ],),
                    const SizedBox(width: 5,),

                    Image.network(product.image , width: 85, height:85,),
                  ],),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: boldText(text: product.title, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.price.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightGray,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(AppImages.currency, width: 15,height: 10,),
                  const SizedBox(width: 5),
                  Text(
                      product.category.toString().split('.').last,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.pink),
                  ),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: Container(
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                    Icon(Icons.location_on_outlined , color: AppColors.white,size: 15,),
                    SizedBox(width: 5,),

                  ],
                ),
              ),
            )
          ],)
    );
  }
}
