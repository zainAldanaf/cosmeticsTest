
import 'package:cosmeticstest/core/Services/remot_service.dart';
import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/CustomContainer.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/features/Providers/category_provider/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/features/Providers/productsProvider/ProductProvider.dart';
import '../../../core/features/Providers/productsProvider/Products.dart';
import '../../../core/models/productItem.dart';
import '../../favoriteScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  late ProductProvider  productProvider = Provider.of<ProductProvider>(context, listen: false) ;

  @override
  void initState() {
    super.initState();
    productProvider.getDate();
  }

  final List<ProductCategory> category = [
    ProductCategory(1, AppText.beauty, AppImages.cosmeticsSvg),
    ProductCategory(2, AppText.baby, AppImages.baby),
    ProductCategory(3, AppText.accessories, AppImages.accessory),
    ProductCategory(4, AppText.nature, AppImages.nature),
    ProductCategory(5, AppText.pharmacy, AppImages.pharmacy),
    ProductCategory(6, AppText.optics, AppImages.optics),
  ];

  final List<ProductItems> Radioproduct = [
    ProductItems(AppImages.radio, AppText.radio, '66', '56', AppText.city),
    ProductItems(AppImages.radio, AppText.radio, '66', '56', AppText.city),
    ProductItems(AppImages.radio, AppText.radio, '66', '56', AppText.city),
  ];

  final List<ProductItems> babyproduct = [
    ProductItems(AppImages.chair, AppText.chair, '66', '56', AppText.city),
    ProductItems(AppImages.chair, AppText.chair, '66', '56', AppText.city),
    ProductItems(AppImages.chair, AppText.chair, '66', '56', AppText.city),
  ];

  final List<ProductItems> furnituresproduct = [
    ProductItems(AppImages.babyProduct, AppText.bed, '66', '56', AppText.city),
    ProductItems(AppImages.babyProduct, AppText.bed, '66', '56', AppText.city),
    ProductItems(AppImages.babyProduct, AppText.bed, '66', '56', AppText.city),
  ];

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FavoriteScreen()),
    );
  }

  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    final productList = productProvider.items;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CustomContainer(
                    Icon(
                      Icons.notifications_active,
                      color: AppColors.black,
                      size: 30,
                    ),
                    45,
                    45,
                    AppColors.white
                     ),

                 SizedBox(
                  width: 8,
                ),
                CustomContainer(
                    Icon(
                      Icons.favorite_border,
                      color: AppColors.black,
                      size: 30,
                    ),
                    45,
                    45,
                    AppColors.white
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomContainer(
                    Icon(
                      Icons.notifications_none,
                      color: AppColors.black,
                      size: 30,
                    ),
                    45,
                    45,
                    AppColors.white,

                  ),
                const SizedBox(
                  width: 110,
                ),
                Image.asset(
                  AppImages.splashImage,
                  width: 70,
                  height: 70,
                ),
              ],
            ),
          ), //bar
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CustomSearchBar(
              controller: controller,
            ),
          ), //search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: boldText(
              text: AppText.category,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(
            height: 140,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Visibility(
                visible: isLoaded,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = category[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(children: [CustomCategoryContainer(item)]),
                      ),
                    );
                  },
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ), //category
          CustomHomeProductItem(
            items: Radioproduct,
            title: AppText.recentlyAdded,
          ),
          CustomHomeProductItem(
            items: babyproduct,
            title: AppText.choose,
          ),
          CustomHomeProductItem(
            items: furnituresproduct,
            title: AppText.baby,
          ),
        ]),
      ),
    );
  }
}
