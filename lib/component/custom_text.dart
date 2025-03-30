import 'package:flutter/material.dart';
import 'package:it_matrimony/core/constant/colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color color;
  final double? fontsize;
  final FontWeight? fontweight;
  
  const CustomText({
    this.color = AppColor.black,
    this.fontsize = 24,
    this.fontweight,
    this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text("$text",
    style: TextStyle(
      fontSize: fontsize,
      color: color,
      fontWeight: fontweight
    ),

    );
  }
}