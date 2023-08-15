import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/models/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/AppText.dart';
import '../../../../core/custom/CustomAppBar.dart';
import '../../../../core/custom/CustomButton.dart';
import '../../../../core/custom/CustomContainer.dart';
import '../../../../widgets/radio_buttom.dart';
import '../CategoryDetails/subProductPage.dart';

class CategoryProduct extends StatefulWidget{
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  final TextEditingController controller = TextEditingController();

  final List<Product> items = [
    Product(AppImages.table3, AppText.table3, '55', '56', AppText.city),
    Product(AppImages.coffee_table, AppText.coffee_table, '55', '56', AppText.city),
    Product(AppImages.sofa, AppText.sofa, '55', '56', AppText.city),
    Product(AppImages.shoes_table, AppText.shoes_table, '55', '56', AppText.city),
    Product(AppImages.chairK, AppText.chairK, '55', '56', AppText.city),
    Product(AppImages.sofa, AppText.sofa, '55', '56', AppText.city),
  ];

  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppText.homefurniture),
      backgroundColor: AppColors.white,
      body :  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CustomFilterBtn(
                  onPressed: (){
                    return showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return
                            RadioBottomSheetWidget(AppText.order_products);
                        });
                  }, prefixIcon: Icon(Icons.filter_alt_outlined),

                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    width: 300,
                    height: 50,
                    child: CustomSearchBar(controller: controller)),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder
              (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // Number of columns in the grid
              mainAxisSpacing: 15.0, // Spacing between rows
              crossAxisSpacing: 15.0, // Spacing between columns
            ),
              itemCount: items.length,

              itemBuilder: (BuildContext context, int index) {
                return
                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => subProductPage(),
                      ),
                    );
                  },child: CustomProductItem(items[index] as Product,200,320));
              },),
          )
        ],
      ),
    );
  }
}