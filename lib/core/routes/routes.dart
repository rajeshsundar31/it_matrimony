import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_matrimony/presentation/dashboard/dashboard.dart';
import 'package:it_matrimony/presentation/inbox/inbox.dart';
import 'package:it_matrimony/presentation/landing_page/landing_screen.dart';
import 'package:it_matrimony/presentation/login/bloc/login_bloc.dart';
import 'package:it_matrimony/presentation/login/ui/login_view.dart';
import 'package:it_matrimony/presentation/register/contact_info.dart';
import 'package:it_matrimony/presentation/register/education_info.dart';
import 'package:it_matrimony/presentation/register/personal_info.dart';

class CommonRoutes {

  static const String initialRoute = "/";
  static const String logIn = "/login";
  static const String dashboard = "/dashboard";
  static const String personalInfo = "/personal-info";
  static const String contactInfo = "/contact-info";
  static const String educationInfo = "/education";
  static const String inbox = "/inbox";


  Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name){
      case initialRoute:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case logIn:
        return MaterialPageRoute(builder: (context) => BlocProvider(create: (_)=> LoginBloc(),
        child: const LoginView()));
      case personalInfo:
        return MaterialPageRoute(builder: (context) => const PersonalInfo());
      case contactInfo:
        return MaterialPageRoute(builder: (context) => const ContactInfo());
      case educationInfo:
        return MaterialPageRoute(builder: (context) => const EducationInfo());
      case dashboard:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      case inbox:
        return MaterialPageRoute(builder: (context) => const ChatBox());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${setting.name}'),
          ),
        ));
    }
  }
}