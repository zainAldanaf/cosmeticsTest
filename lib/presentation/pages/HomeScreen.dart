import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/CustomContainer.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/models/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/Products.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Product> items = [
    Product(1,AppText.beauty,AppImages.cosmeticsSvg),
    Product(2,AppText.baby,AppImages.baby),
    Product(3,AppText.accessories,AppImages.accessory),
    Product(4,AppText.nature,AppImages.nature),
    Product(5,AppText.pharmacy,AppImages.pharmacy),
    Product(6,AppText.optics,AppImages.optics),

    // Add more items as needed
  ];
  late final Product _product;

  final List<Items> item = [
    Items(1,AppText.radio,AppImages.radio,'55','60',AppText.city),

    // Add more items as needed
  ];
  late final Items _Items;
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
                  child: ListView.builder(
                    itemBuilder:(context, index) {
                      final item = items[index];
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
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                  ),
                  ), //category
              Row(
                children: [
                  SizedBox(width:20 ,),
                  SubTitleText(subTitle: AppText.more),
                  SizedBox(width:210 ,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23
                    ),
                    child: boldText(
                      text: AppText.recentlyAdded,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              /*SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(children: [
                          CustomHomeItem(
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              )*/

            ]),
      ),
    );
  }
}
