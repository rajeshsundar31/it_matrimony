
import 'package:it_matrimony/presentation/data_layer.dart';
import 'package:it_matrimony/presentation/payment_info/payment_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (_) => FetchData()),
  ChangeNotifierProvider(create: (_) => PaymentController())
];