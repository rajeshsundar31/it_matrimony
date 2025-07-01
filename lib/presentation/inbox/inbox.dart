import 'package:flutter/material.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/routes/routes.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.inboxHeading),
          leading: IconButton(onPressed: (){
            Navigator.pushNamed(context, CommonRoutes.dashboard);

          }, icon: Icon(Icons.arrow_back_ios)),
        ),
      ));
  }
}