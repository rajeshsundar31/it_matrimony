import 'package:flutter/material.dart';
import 'package:it_matrimony/core/utils/assets_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: _getBodyContent(context),
    ));
  }

  Widget _getBodyContent(BuildContext context) {
    return Column(
      children: [
        _getLoginImage(context)
      ],
    );
  }

  Widget _getLoginImage(BuildContext context) {
    return Image.asset(AssetsUtils.loginImage);
  }
}