import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_matrimony/component/bottom_navigation.dart';
import 'package:it_matrimony/core/services/api_services.dart';
import 'package:it_matrimony/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:it_matrimony/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:it_matrimony/presentation/dashboard/dashboard.dart';
import 'package:it_matrimony/presentation/inbox/bloc/inbox_bloc.dart';
import 'package:it_matrimony/presentation/inbox/inbox.dart';
import 'package:it_matrimony/presentation/landing_page/landing_screen.dart';
import 'package:it_matrimony/presentation/login/bloc/login_bloc.dart';
import 'package:it_matrimony/presentation/login/ui/login_view.dart';
import 'package:it_matrimony/presentation/payment_info/payment_controller.dart';
import 'package:it_matrimony/presentation/payment_info/payment_info.dart';
import 'package:it_matrimony/presentation/register/contact_info.dart';
import 'package:it_matrimony/presentation/register/education_info.dart';
import 'package:it_matrimony/presentation/register/personal_info.dart';
import 'package:provider/provider.dart';

class CommonRoutes {
  static const String initialRoute = "/";
  static const String logIn = "/login";
  static const String dashboard = "/dashboard";
  static const String personalInfo = "/personal-info";
  static const String contactInfo = "/contact-info";
  static const String educationInfo = "/education";
  static const String inbox = "/inbox";
  static const String botomNavigation = "/bottombar";
  static const String paymentInfo = "payment";

  Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case logIn:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => LoginBloc(),
                child: const LoginView(),
              ),
        );
      case personalInfo:
        return MaterialPageRoute(builder: (context) => const PersonalInfo());
      case contactInfo:
        return MaterialPageRoute(builder: (context) => const ContactInfo());
      case educationInfo:
        return MaterialPageRoute(builder: (context) => const EducationInfo());
      case dashboard:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => UserBloc(ApiServices())..add(FetchUser()),
                child: const DashboardScreen(),
              ),
        );
      case inbox:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => InboxBloc(ApiServices())..add(FetchUserChat()),
                child: const ChatBox(),
              ),
        );
      case botomNavigation:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: BottomNavigationItem()
        ));
      case paymentInfo:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => PaymentController(),
            child: PaymentInfo()));
      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${setting.name}'),
                ),
              ),
        );
    }
  }
}
