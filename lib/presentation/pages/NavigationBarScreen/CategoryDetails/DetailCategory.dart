import 'package:cosmeticstest/presentation/pages/NavigationBarScreen/CategoryDetails/DetailScreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/AppText.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/custom/CustomAppBar.dart';
import '../../../../core/models/CategoryTypes.dart';
import 'package:grouped_list/grouped_list.dart';

class DetailCategory extends StatefulWidget{
  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {

  final List<CategoryTypes> category_types=[
    CategoryTypes(AppText.clothsCat),
    CategoryTypes(AppText.furnitureCat),
    CategoryTypes(AppText.electronicCat),
    CategoryTypes(AppText.baby),
    CategoryTypes(AppText.carsCat),
    CategoryTypes(AppText.apartmentsCat),
    CategoryTypes(AppText.sellersCat),
    CategoryTypes(AppText.donationsCat),


  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: CustomAppBar(AppText.category),
        backgroundColor: AppColors.lightGray2,
        body:
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGray.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListView.separated(
            //  itemCount: 8,
             /* separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 10,
                    thickness: 2,
                    color: AppColors.lightGray2,
                  ),
              itemBuilder: (BuildContext context, int index) {
                final item = category_types[index];

                return ListTile(
                  title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item.title, // Replace with your title
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                  ),
                  leading: Icon(Icons.arrow_back_ios_new, size: 20,color: AppColors.lightPink,),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16),
                  dense: true,
                );
              }),
         ),)
*/

              separatorBuilder: (BuildContext context, int index) => Divider(height: 10,thickness: 2,color: AppColors.lightGray2,),
              itemCount: category_types.length, // Number of list items
              itemBuilder: (BuildContext context, int index) {
                final item = category_types[index];

                return Column(
                  children: [

                    //    GestureDetector(onTap: (){
                    //       Navigator.push(
                    //        context,
                    //       MaterialPageRoute(
                    //      builder: (context) => DetailScreen2(itemIndex:index),
                    //   ),
                    // );
                    //     },),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen2(itemIndex: index),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              item.title, // Replace with your title
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                        ),
                        leading: Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.lightPink,),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        dense: true,
                      ),
                    ),
                  ],
                );
              }),
                ),
                ),
                );
  }
}