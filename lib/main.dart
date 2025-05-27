import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/presentation/landing_page/landing_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: providerList,
    //   child: 
      return GetMaterialApp(
        debugShowCheckedModeBanner: false, 
        home: const LandingScreen(),
        onGenerateRoute: CommonRoutes().generatedRoutes,
        initialRoute: '/',
      );
    // );
  }
}
