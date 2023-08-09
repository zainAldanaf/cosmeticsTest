import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/CustomContainer.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/Products.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Category> category = [
    Category(1,AppText.beauty,AppImages.cosmeticsSvg),
    Category(2,AppText.baby,AppImages.baby),
    Category(3,AppText.accessories,AppImages.accessory),
    Category(4,AppText.nature,AppImages.nature),
    Category(5,AppText.pharmacy,AppImages.pharmacy),
    Category(6,AppText.optics,AppImages.optics),
  ];

  final List<Product> product = [
    Product(AppImages.radio, AppText.radio, '66', '56', AppText.city),
    Product(AppImages.radio, AppText.radio, '66', '56', AppText.city),
    Product(AppImages.radio, AppText.radio, '66', '56', AppText.city),
  ];
  late final Category _category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const CustomContainer(Icon(Icons.notifications_active, color: AppColors.black, size: 30,)),
                    const SizedBox(width: 8,),
                    const CustomContainer(Icon(Icons.favorite_border, color: AppColors.black, size: 30,)),
                    const SizedBox(width: 8,),
                    const CustomContainer(Icon(Icons.notifications_none, color: AppColors.black, size: 30,)),
                    const SizedBox(width: 110,),
                    Image.asset(AppImages.splashImage, width: 70, height: 70,),
                  ],
                ),
              ), //bar
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomSearchBar(controller: controller,),
              ), //search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20
                ),
                child: boldText(text: AppText.category, fontWeight: FontWeight.bold, fontSize: 20,),
              ),

              SizedBox(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ListView.builder(
                      itemBuilder:(context, index) {
                        final item = category[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Row(children: [
                              CustomCategoryContainer(item)
                            ]),
                          ),
                        );
                      },
                      itemCount: category.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  ), //category
              CustomHomeProductItem(items: product, title: AppText.recentlyAdded,),
              CustomHomeProductItem(items: product, title: AppText.beauty,),



            ]),
      ),
    );
  }
}