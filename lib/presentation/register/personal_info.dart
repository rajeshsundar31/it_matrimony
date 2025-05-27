import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_matrimony/component/custom_button.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/app_size.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
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
              'Personal Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: displayHeight(context)/10),
        //personal infor
        _getName(context),
        _getGender(context),
        _getDob(context),
        _getHeight(context),
        _getWeight(context),
        _getMotherTongue(context),
        _getReligion(context),
        //religioun
        //caste

        //education
        //high-qualification
        //institute
        //annual income
        
        //family
        //father name occu
        //mother name occu
        //sibling (bro/sis/ married/unmarried)
        // family type(joint/nuclear)
        // _getProffession(context),
        _buildButton(context),
        
      ],
    );
  }

  Flexible _getName(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('Name'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please Enter Full Name';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your Full Name",
            labelText: "Name",
          ),
        ),
      ),
    );
  }

  Flexible _getHeight(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('height'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please correct Height';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your  Height",
            labelText: "Height",
          ),
        ),
      ),
    );
  }

   Flexible _getWeight(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          key: const Key('weight'),
          validator: (value) {
            if (value == null || value.length < 4) {
              return 'Please correct Height';
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            hintText: "Enter Your  Weight",
            labelText: "Weight Kg",
          ),
        ),
      ),
    );
  }

  Flexible _getMotherTongue(BuildContext context) {
    final List<String> dropdownItems = [
    'Tamil',
    'English',
    'Telugu',
    'Marati',
    'Hindi',
  ];

  String? selectedValue;
    return Flexible(
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Select Your Mother Tongue',
            border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          items: dropdownItems.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
  

   Flexible _getGender(BuildContext context) {
    final List<String> dropdownItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;
    return Flexible(
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Gender',
            border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          items: dropdownItems.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Flexible _getDob(BuildContext context) {
    DateTime date = DateTime(2016, 10, 26);

    void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            showDayOfWeek: true,
            onDateTimeChanged: (DateTime newDate) {
              setState(() => date = newDate);
            },
          ),
        ),
      ),
    );
  }
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => _showDatePicker(context),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            child: Text(
              '${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}-${date.year}',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }

   Flexible _getReligion(BuildContext context) {
    final List<String> dropdownItems = [
    'Hindu',
    'Christian',
    'Muslim',
  ];

  String? selectedValue;
    return Flexible(
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Select Your Religion',
            border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          items: dropdownItems.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
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
          Navigator.pushNamed(context, CommonRoutes.contactInfo);
            
          },
        ),
      )
      );
  }
}
