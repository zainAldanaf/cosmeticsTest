import 'package:flutter/cupertino.dart';
import '../../../constant/Images.dart';
import '../../../constant/AppText.dart';
import '../../../models/Products.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> items = [];

  Future<void> getDate() async {
    await Future.delayed(Duration(seconds: 4));
    List<Product> _items = [
      Product(AppImages.table3, AppText.table3, '55', '56', AppText.city),
      Product(AppImages.coffee_table, AppText.coffee_table, '55', '56', AppText.city),
      Product(AppImages.sofa, AppText.sofa, '55', '56', AppText.city),
      Product(AppImages.shoes_table, AppText.shoes_table, '55', '56', AppText.city),
      Product(AppImages.chairK, AppText.chairK, '55', '56', AppText.city),
      Product(AppImages.sofa, AppText.sofa, '55', '56', AppText.city),

    ];

    items.addAll(_items);

    notifyListeners();
  }
}
