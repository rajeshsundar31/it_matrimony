import 'package:flutter/material.dart';
import 'package:it_matrimony/component/custom_button.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/utils/app_size.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
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
          padding: const EdgeInsets.only(left: 8.0, top: 24.0),
          child: Center(
            child: Text(
              'Contact Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: displayHeight(context)/10),
        _getPhoneNumber(context),
        _getEmail(context),
        _getBuilding(context),
        _getStreet(context),
        _getcity(context),
        _getPinCode(context),
        _buildButton(context)
      ]);
      }

   Flexible _getPhoneNumber(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('phone'),
          validator: (value) {
            if (value == null || value.length < 10 || value.length > 10) {
              return 'Please Enter valid Mobile Number';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Valid Phone number",
            labelText: "Phone",
          ),
        ),
      ),
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
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Valid Mail",
            labelText: "Email",
          ),
        ),
      ),
    );
  }

  Flexible _getBuilding(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('email'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Valid Building Address';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Building Number",
            labelText: "House/ Door No",
          ),
        ),
      ),
    );
  }

  Flexible _getStreet(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('street'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Valid Street Name';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Street Name",
            labelText: "Street Name",
          ),
        ),
      ),
    );
  }

  Flexible _getcity(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('city'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Valid city';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your city",
            labelText: "city",
          ),
        ),
      ),
    );
  }

  Flexible _getPinCode(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('pin'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Valid Pin code';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your pin code",
            labelText: "PinCode",
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
          // Navigator.pushNamed(context, CommonRoutes.contactInfo);
            
          },
        ),
      )
      );
  }
}