import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Bike {
  Bike({
    this.id,
    this.name,
    this.category,
    this.frameSize,
    this.images,
    this.price
  });

  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
    id: json['id'] as int,
    name: json['name'] as String,
    images: List.from(json['images']),
    price: json['price'] as int,
    category: json['category'] as String,
    frameSize: json['frameSize'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': this.id,
    'name': this.name,
    'category': this.category,
    'frameSize': this.frameSize,
    'images': this.images,
    'price': this.price
  };

  @JsonKey(name: 'id')
  int id;
  String name;
  String category;
  String frameSize;
  @JsonKey(name: 'images')
  List<String> images;
  int price;

}
