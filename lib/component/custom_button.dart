import 'package:flutter/material.dart';
import 'package:it_matrimony/core/constant/colors.dart';

class CustomButton extends StatefulWidget {
  final Color color;
  final String? text;
  final double? height;
  final double? width;
  final void Function()? onPress;
  const CustomButton({
    this.color = AppColor.primary,
    this.text,
    this.onPress,
    this.height,
    this.width,
    super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColor.cardcolor)
        ),
        onPressed: widget.onPress, 
        child: Text("${widget.text}", style: TextStyle(color: AppColor.white))));
  }
}