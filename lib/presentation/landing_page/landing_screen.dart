import 'package:flutter/material.dart';
import 'package:it_matrimony/component/custom_button.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/app_size.dart';
import 'package:it_matrimony/core/utils/assets_utils.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getbody(context),
        );
  }

  Widget _getbody(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          _landingPageImage(context),
          SizedBox(height: displayHeight(context)/4),
          _cntueButton(context),
        ],
      ),
    );
  }

  Widget _landingPageImage(BuildContext context) {
    return Image.asset(AssetsUtils.landingImage, fit: BoxFit.fill);
  }

  Widget _cntueButton(BuildContext context){
    return CustomButton(
      text: AppStrings.btnContue,
      onPress: () {
        Navigator.pushNamed(context, CommonRoutes.dashboard);
    },
    width: displayWidth(context)/1.3,
    );
  }

  
}