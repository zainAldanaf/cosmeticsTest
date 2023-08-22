import 'dart:convert';

class Category{
  List<String> postFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));
  String postToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

  String? id;
  String? title;

  Category( {required id, required title});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
  );
}