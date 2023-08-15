import 'package:cosmeticstest/core/custom/CustomAppBar.dart';
import 'package:cosmeticstest/core/custom/CustomContainer.dart';
import 'package:cosmeticstest/presentation/pages/NavigationBarScreen/CategoryDetails/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/AppText.dart';
import '../../../../core/constant/Images.dart';
import '../../../../core/models/category.dart';
import '../CategoryDetails/DetailCategory.dart';

class Categories extends StatefulWidget{
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<Category> category = [
    Category(1,AppText.beauty,AppImages.cosmeticsSvg),
    Category(2,AppText.baby,AppImages.baby),
    Category(3,AppText.accessories,AppImages.accessory),
    Category(4,AppText.nature,AppImages.nature),
    Category(5,AppText.pharmacy,AppImages.pharmacy),
    Category(6,AppText.optics,AppImages.optics),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(AppText.category),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 2.0,
            ),
            itemCount: 6, // Number of items in the grid
            itemBuilder: (context, index) {
              final item = category[index];
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => cartScreen(),
                        ),
                      );
                    },
                    child: CustomCategoryPageContainer(item)),
              );
            },
          ),
        ),
    );
  }
}