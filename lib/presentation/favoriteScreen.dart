import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/models/favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constant/AppText.dart';
import '../core/constant/Images.dart';
import '../core/custom/CustomAppBar.dart';
import '../core/custom/CustomContainer.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController controller = TextEditingController();

  final List<Favorite> favorite = [
    Favorite(AppText.name, AppImages.person),
    Favorite(AppText.company, AppImages.company),
    Favorite(AppText.name, AppImages.person),
    Favorite(AppText.company, AppImages.company),
    Favorite(AppText.name, AppImages.person),
    Favorite(AppText.company, AppImages.company),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppText.favorite),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Container(
                    width: 380,
                    height:40,
                    child: CustomSearchBar(controller: controller)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 5.0, // Spacing between rows
                crossAxisSpacing: 2.0, // Spacing between columns
              ),
              itemCount: 6, // Number of items in the grid
              itemBuilder: (context, index) {
                final item = favorite[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                      onTap: () {},
                      child: CustomFavoriteContainer(
                        favorite: item,
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
