import 'package:flutter/material.dart';
import 'package:it_matrimony/core/constant/colors.dart';

class CommonAppBar extends StatefulWidget {
  const CommonAppBar({super.key, this.title});
  final String? title;


  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, color: AppColor.black,)),
        
      ),

    );
  }
}