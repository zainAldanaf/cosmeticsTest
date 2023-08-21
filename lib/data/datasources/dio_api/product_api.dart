
import 'package:dio/dio.dart';

class ProductApi{
  Dio dio = Dio(); //Create an instance of Dio to make HTTP requests


  //Making GET Request:
  void fetchData() async {
    try {
      Response response = await dio.get('https://api.example.com/data');
      print(response.data);
    } catch (error) {
      print('Error: $error');
    }
  }

  // Making POST Request:
  void postData() async {
    try {
      Response response = await dio.post(
        'https://api.example.com/post',
        data: {'key': 'value'},
      );
      print(response.data);
    } catch (error) {
      print('Error: $error');
    }
  }
}