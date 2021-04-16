import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';

Widget headingTextWidget({
  String text,
  Color textColor = Colors.black,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
}) {
  return textWidget(
    text: text,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget headingTextWidgetFontSize30({
  String text,
  Color textColor = Colors.black,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
}) {
  return textWidget(
    text: text,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget titleTextWidget({
  String text,
  Color textColor = Colors.black,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
  Key key,
}) {
  return textWidget(
    key: key,
    text: text,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget subTitleTextWidget({
  String text,
  Color textColor = Colors.black,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
}) {
  return textWidget(
    text: text,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget detailTextWidget({
  String text,
  Color textColor = AppColors.detailText,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
}) {
  return textWidget(
    text: text,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    alignment: alignment,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget detailTextWidgetBold({
  String text,
  Color textColor = AppColors.detailText,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
}) {
  return textWidget(
    text: text,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget minimalTextWidget({
  String text,
  Color textColor = Colors.white,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
  Key key,
}) {
  return textWidget(
    key: key,
    text: text,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget minimalBoldTextWidget({
  String text,
  Color textColor = Colors.white,
  TextAlign alignment = TextAlign.left,
  int maxLines = 1,
}) {
  return textWidget(
    text: text,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: textColor,
    maxLines: maxLines,
  );
}

Widget textWidget({
  String text,
  double fontSize,
  FontWeight fontWeight,
  Color color,
  TextAlign alignment,
  int maxLines = 1,
  Key key,
}) {
  return Text(
    text,
    key: key,
    overflow: TextOverflow.ellipsis,
    textAlign: alignment,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
