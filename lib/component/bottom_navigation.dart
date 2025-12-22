import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/services/api_services.dart';
import 'package:it_matrimony/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:it_matrimony/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:it_matrimony/presentation/dashboard/dashboard.dart';
import 'package:it_matrimony/presentation/inbox/bloc/inbox_bloc.dart';
import 'package:it_matrimony/presentation/inbox/inbox.dart';
import 'package:it_matrimony/presentation/landing_page/landing_screen.dart';

class BottomNavigationItem extends StatefulWidget {
  const BottomNavigationItem({super.key});

  @override
  State<BottomNavigationItem> createState() => _BottomNavigationItemState();
}

class _BottomNavigationItemState extends State<BottomNavigationItem> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    BlocProvider(
      create: (context) => UserBloc(ApiServices())..add(FetchUser()),
      child: DashboardScreen(),
    ),
    BlocProvider(create: (context) => InboxBloc(ApiServices())..add(FetchUserChat()), child: ChatBox()),
    LandingScreen(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        selectedItemColor: AppColor.primary,
        onTap: _onItemSelected,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
