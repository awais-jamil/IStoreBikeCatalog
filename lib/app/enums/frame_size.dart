import 'package:json_annotation/json_annotation.dart';

enum FrameSize {
  @JsonKey(name: 'small')
  small,
  @JsonKey(name: 'medium')
  medium,
  @JsonKey(name: 'large')
  large,
}
