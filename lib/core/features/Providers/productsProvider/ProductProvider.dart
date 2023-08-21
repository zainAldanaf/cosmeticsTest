import 'package:cosmeticstest/domain/entities/enums/provider_enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/Products.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> items = [];

  PageState errorType = PageState.dataLoading;

  String getErrorMessage(PageState errorType) {
    switch (errorType) {
      case PageState.showData:
        return "Data found";

      case PageState.dataNotFound:
        return "Data not found";

      case PageState.dataLoading:
        return "Data Loading";

      case PageState.pageError:
        return "page error";

      case PageState.networkProblem:
        return "Network problem";

      default:
        return "An error occurred";
    }
  }

  Future<void> getDate() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        List<Product> _items = (response.data as List).map((x) => Product.fromJson(x)).toList();
        items.addAll(_items);

        if (items.isEmpty) {
          errorType = PageState.dataNotFound;
        } else {
          errorType = PageState.showData;
        }
      }
      if (items.isEmpty) {
        errorType = PageState.dataNotFound;
      } else {
        errorType = PageState.showData;
      }
      notifyListeners();

    } catch (e) {
      errorType = PageState.pageError;
    }

    print("errorTypennn $errorType");
  }
}
