import 'package:cosmeticstest/domain/entities/enums/provider_enum.dart';
import 'package:flutter/cupertino.dart';
import '../../../constant/Images.dart';
import '../../../constant/AppText.dart';
import '../../../models/Products.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> items = [];
  ErrorType errorType=ErrorType.dataLoading;
  String getErrorMessage(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.showData:
        return "Data found";

      case ErrorType.dataNotFound:
        return "Data not found";

      case ErrorType.dataLoading:
        return "Data Loading";

      case ErrorType.pageError:
        return "page error";

      case ErrorType.networkProblem:
        return "Network problem";

      default:
        return "An error occurred";
    }
  }

  Future<void> getDate() async {

    try{


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

    if(items.isEmpty){
      errorType=ErrorType.dataNotFound;
    }else{
      errorType=ErrorType.showData;

    }
    }catch(e){
      errorType=ErrorType.pageError;

    }
    notifyListeners();
    print("errorType $errorType");
  }
}
