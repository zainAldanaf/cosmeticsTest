
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/AppText.dart';
import '../constant/colors.dart';
import '../models/Products.dart';


class CustomContainer extends StatelessWidget{
   final Widget? prefixIcon;

  const CustomContainer(
    this.prefixIcon
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 52,
      height: 50,
      child: prefixIcon,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
    );
  }

}
class CustomSearchBar extends StatelessWidget{

  final TextEditingController controller;

   CustomSearchBar({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: AppText.search,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

      ),
      onChanged: (value) {
        // Handle search query changes here
      },
    );
  }

}
class CustomCategoryContainer extends StatelessWidget{

  final Category category;

  CustomCategoryContainer(this.category);


  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: 90,
      height: 95,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      child: Center(
        child: Column(children: [
          SizedBox(height: 10,),
          SvgPicture.asset(category.image as String, width: 40, height: 40, color: AppColors.white,),
          SizedBox(height: 7,),
          Text(category.title, style: TextStyle(color: AppColors.white, fontSize: 16),),

        ],),
      ),

    );
  }

}

class CustomProductItem extends StatelessWidget{


  final Product product;
  CustomProductItem(this.product);


  @override
  Widget build(BuildContext context) {
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
                 SizedBox(height: 8,),
                 Positioned(
                   top: 50,
                   left: 50,
                 child:Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 6),
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
           Image.asset(product.image),
         ],),
       ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: boldText(text:product.title, fontWeight: FontWeight.bold, fontSize: 20),
          ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
             Text(
               product.oldPrice as String,
               style: const TextStyle(
                 fontSize: 18,
                 decoration: TextDecoration.lineThrough,
                 color: AppColors.lightGray,
               ),
             ),
             const SizedBox(width: 10),
             SvgPicture.asset(AppImages.currency, width: 15,height: 10,),
             const SizedBox(width: 5),
             Text(
               product.price as String,
               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: AppColors.pink),
             ),
           ],),
         ),
         Container(
           width: 100,
           height: 25,
           decoration: BoxDecoration(
             shape: BoxShape.rectangle,
             color: AppColors.pink,
             borderRadius: BorderRadius.circular(15),
           ),
           child: Center(
             child: Text(
               product.city,
               style: const TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                   color: AppColors.white
               ),),
           ),
         )
     ],)
   );
  }
}

class CustomHomeProductItem extends StatelessWidget{

  List<Product>? items;
  String? title;
  CustomHomeProductItem({this.items , this.title});

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.end,
     children: [
       Row(
         children: [
           SizedBox(width:20 ,),
           SubTitleText(subTitle: AppText.more),
           SizedBox(width:210 ,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 23
             ),
             child: boldText(
               text: title?? '',
               fontWeight: FontWeight.bold,
               fontSize: 19,
             ),
           ),
         ],
       ),
       SizedBox(
         height: 250,
         child: ListView.builder(
           itemBuilder:(context, index) {
             Product product = items![index];
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: InkWell(
                 onTap: () {},
                 child: Row(children: [
                   CustomProductItem(product)
                 ]),
               ),
             );
           },
           itemCount: items?.length??0,
           scrollDirection: Axis.horizontal,
         ),
       )
   ],);
  }

}