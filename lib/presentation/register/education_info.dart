import 'package:flutter/material.dart';
import 'package:it_matrimony/component/custom_button.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/app_size.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: _buildContainer(context),
      ),
    );
  }

   Widget _buildContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(120)),
        boxShadow: [
          BoxShadow(
            offset: Offset(5.0, 5.0),
            color: AppColor.black,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: _buildColumn(context),
    );
  }

   Widget _buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 42.0),
          child: Center(
            child: Text(
              'Educational Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: displayHeight(context)/10),
        _getEducation(context),
        _getCurrentOrganization(context),
        _getAnnualIncome(context),
         _buildButton(context),
        
      ],
    );
  }

  Flexible _getEducation(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('Name'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Vaild Education';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Higher Education",
            labelText: "Education",
          ),
        ),
      ),
    );
  }

   Flexible _getCurrentOrganization(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('Name'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Your Current Organization';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Company Name",
            labelText: "Company",
          ),
        ),
      ),
    );
  }

   Flexible _getAnnualIncome(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('Name'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Valid Annual Income';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Annual Income",
            labelText: "Salary",
          ),
        ),
      ),
    );
  }

   Flexible _buildButton( BuildContext context){
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          width: displayWidth(context)/1,
          text: AppStrings.btnContue,
          color: AppColor.gold,
          onPress: () {
          Navigator.pushNamed(context, CommonRoutes.dashboard);
          },
        ),
      )
      );
  }
}