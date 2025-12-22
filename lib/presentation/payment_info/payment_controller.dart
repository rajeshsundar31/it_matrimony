
import 'package:flutter/material.dart';

class PaymentController extends ChangeNotifier {

  onInit(context) async {
    await selectDate(context);
    await addNewItem();
  }

  List <String> items = ["Current Account"];
  String? selectedValue;

  DateTime? selectedDate = DateTime.now();
  final TextEditingController dropdownController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDate, 
      firstDate: DateTime(1900), 
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
    }
    notifyListeners();
  }

  selectedDropDownValue(value) {
    selectedDate = value;
    notifyListeners();
  }

  addNewItem() {
    if (dropdownController.text.isNotEmpty){
        items.add(dropdownController.text);
        selectedValue = dropdownController.text;
      dropdownController.clear();
      
    }
    notifyListeners();
  }

}