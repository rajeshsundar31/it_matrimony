import 'package:flutter/material.dart';
import 'package:it_matrimony/presentation/landing_screen.dart';
import 'package:it_matrimony/presentation/login/login_view.dart';

class CommonRoutes {

  static const String logIn = "/login";
  Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name){
      case "/":
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case logIn:
        return MaterialPageRoute(builder: (context) => const LoginView());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${setting.name}'),
          ),
        ));
    }
  }
}