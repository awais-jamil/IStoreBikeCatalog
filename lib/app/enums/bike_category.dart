import 'package:json_annotation/json_annotation.dart';

enum Category {
  @JsonKey(name: 'mountain_bike')
  mountain_bike,
  @JsonKey(name: 'city_bike')
  city_bike,
  @JsonKey(name: 'ebike')
  ebike,
}
