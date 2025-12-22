import 'package:flutter/material.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/presentation/payment_info/payment_controller.dart';
import 'package:provider/provider.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _expenseKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PaymentController>(context, listen: false).onInit(context);
    });
    return Scaffold(
      appBar: _getAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _getAppBar(BuildContext context){
    return AppBar(
      backgroundColor: AppColor.primary,
      title: Text(
        AppStrings.paymentInfo,
        style: TextStyle(
          color: AppColor.white,
          fontSize: 24,
          fontWeight: FontWeight.w700
        ),
        ),
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(
        Icons.arrow_back_ios,
        color: AppColor.white,
        )),
      bottom: TabBar(
        labelColor: AppColor.white,
        controller: _tabController,
        tabs: [
          Tab(text: "Expenses"),
          Tab(text: "Income")

      ]),
    );
  }

  Widget _buildBody(BuildContext context){
    return TabBarView(
      controller: _tabController,
      children: [
        Center(child: _buildExpenseForm(context)),
        Center(child: Text('Income content')),
    ]);
  }

  Widget _buildExpenseForm(BuildContext context){

 void _showAddDialog(BuildContext parentContext) {
  showDialog(
    context: parentContext,
    builder: (dialogContext) {
      final provider = parentContext.read<PaymentController>();

      return AlertDialog(
        title: const Text('Add new item'),
        content: TextField(
          controller: provider.dropdownController,
          decoration: const InputDecoration(
            hintText: 'Enter item name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              provider.addNewItem();
              Navigator.pop(dialogContext);
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}

    return Consumer<PaymentController>(
      builder: (context, payment, _) {
        return  Form(
        key: _expenseKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(payment.selectedDate!.toLocal().toString().split(' ')[0]),
                trailing: IconButton(onPressed: (){
                  payment.selectDate(context);
                }, icon: Icon(Icons.calendar_month_outlined)),
              )
            ),
            DropdownButton(
              hint: const Text("Select Your Account"),
              items: [
                ...payment.items.map((element) => DropdownMenuItem(
                  value: element,
                  child: Text(element))),
                const DropdownMenuItem(
                  value: "add_new",
                  child: Text("+ Add new Value"))
              ], 
            onChanged: (value){
              if (value == "add_new"){
                _showAddDialog(context);
              }else {
                payment.selectedDropDownValue(value);
              }
      
            })
          ],
        )
        );
        
      },
    );
  }
}