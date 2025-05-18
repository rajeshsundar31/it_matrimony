import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:it_matrimony/component/custom_button.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/app_size.dart';
import 'package:it_matrimony/core/utils/assets_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: _getBodyContent(context),
    ));
  }

  Widget _getBodyContent(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getLoginImage(context),
            SizedBox(height: displayHeight(context)/10),
            _getEmail(context),
            _getPassword(context),
            _buildButton(context),
            _buildCreateUser(context)
          ],
        ),
      ),
    );
  }

  Widget _getLoginImage(BuildContext context) {
    return Stack(
      children: [
        Container(
        height: displayHeight(context)/3,
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(160)),
        ),
      ),
        Padding(
          padding: EdgeInsets.only(top: 70, left: 150),
          child: ClipOval(
                child: Image.asset(
          AssetsUtils.rings,
          color: AppColor.white,
          height: displayHeight(context) / 7,
          width: displayHeight(context) / 7, 
          fit: BoxFit.cover,
                ),
          ),
        ),
      ],
    );
  }

   Flexible _getEmail(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('email'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter valid Mail Addess';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              hintText: "Enter Your Valid Mail",
              labelText: "Email"),
        ),
      ),
    );
  }

   Flexible _getPassword(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 8, right: 8),
        child: TextFormField(
          key: const Key("password"),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              hintText: "Enter Strong Password",
              labelText: "Password"),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Password cannot be Empty';
            } else if (value.length < 4 || value.length > 12) {
              return 'Password cannot be less than 4 and more than 12';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }

  Flexible _buildButton( BuildContext context){
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: CustomButton(
          width: displayWidth(context)/2,
          text: AppStrings.login,
          color: AppColor.gold,
          onPress: () {
          Navigator.pushNamed(context, CommonRoutes.dashboard);            
          },
        ),
      )
      );
  }

  Widget _buildCreateUser(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 15), 
      child: RichText(text: TextSpan(
        children: [
          TextSpan(text: 'Don\'t have an account?', style: TextStyle(color: AppColor.black, fontSize: 16)),
          WidgetSpan(child: SizedBox(width: 10,)),
          TextSpan(text: 'Sign-up', 
          style: TextStyle(color: AppColor.primary),
          recognizer: TapGestureRecognizer()..onTap =  (){
            Navigator.pushNamed(context, CommonRoutes.personalInfo);
          },
          )
        ]
      )
      ),
      );
  }
}