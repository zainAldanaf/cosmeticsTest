
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/features/Providers/productsProvider/Products.dart';
import 'package:cosmeticstest/core/models/favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../constant/AppText.dart';
import '../constant/colors.dart';
import '../features/Providers/category_provider/category.dart';
import '../features/Providers/category_provider/category_provider.dart';
import '../models/productItem.dart';

class CustomContainer extends StatefulWidget{
  double? width;
  double? height;

  final Category category;


  CustomContainer(
      this.category,
      this.width,
      this.height,
      );

  List<Category> categoryItems = [];

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categoryList = categoryProvider.items;

      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Text(category.),
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

  final ProductCategory category;

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

class CustomHomeProductItem extends StatefulWidget{

  List<ProductItems>? items;
  String? title;

  CustomHomeProductItem({this.items , this.title});

  @override
  State<CustomHomeProductItem> createState() => _CustomHomeProductItemState();
}

class _CustomHomeProductItemState extends State<CustomHomeProductItem> {

  var isLoaded = false;
  List<ProductItems>? items;


  @override
  void initState() {
    super.initState();
  }
 // fetch data

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
               text: widget.title?? '',
               fontWeight: FontWeight.bold,
               fontSize: 19,
             ),
           ),
         ],
       ),
       SizedBox(
         height: 250,
         child: Visibility(
           visible: isLoaded,
           replacement: const Center(child: CircularProgressIndicator(),),
           child: ListView.builder(
             itemBuilder:(context, index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: () {},
                   child: Text('oo'),
                     //CustomProductItem(postt as Product, 170,320,)

                 ),
               );
             },
             itemCount: items?.length  ??0,
             scrollDirection: Axis.horizontal,
           ),
         ),
       )
   ],);
  }
}

class CustomCategoryPageContainer extends StatelessWidget{

  final ProductCategory categoryPage;

  CustomCategoryPageContainer(this.categoryPage);


  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 192,
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        child: Center(
          child: Column(children: [
            SizedBox(height: 15,),
            SvgPicture.asset(categoryPage.image as String, width: 68, height: 68, color: AppColors.white,),
            SizedBox(height: 25,),
            Text(categoryPage.title, style: TextStyle(color: AppColors.white, fontSize: 22),),

          ],),
        ),

      );
  }

}

class CustomFavoriteContainer extends StatelessWidget{

  final Favorite favorite;

  const CustomFavoriteContainer({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 290,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the shadow direction
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Positioned(
                  right: 15, // Adjust the position of the icon outside the circle
                  bottom: 10, // Adjust the position of the icon outside the circle
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    // Background color for the circle
                  ),

                ),
                Positioned(
                  top: 5,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.white,
                    backgroundImage: AssetImage(favorite.image),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
        boldText(text: favorite.name, fontWeight: FontWeight.bold, fontSize: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 75,
              height: 23,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppText.city,
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
        ],
      ),
    );
  }
}

