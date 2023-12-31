import 'package:cosmeticstest/core/models/productItem.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

 class RemoteServices {
   RemoteServices();
  Dio dio = Dio();

  void fetchData() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');
      print(response.data);
    } catch (error) {
      print('Error: $error');
    }
  }

  void postData() async {
    try {
      Response response = await dio.post(
        'https://fakestoreapi.com/products',
        data: {'key': 'value'},
      );
      print(response.data);
    } catch (error) {
      print('Error: $error');
    }
  }


}