import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/app_size.dart';
import 'package:it_matrimony/core/utils/assets_utils.dart';
import 'package:it_matrimony/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:it_matrimony/presentation/dashboard/bloc/dashboard_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final String title = "Rajeshwaran Senthilkumar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          _buildCardWidget(context),
          Expanded(child: _buildBody(context)),
        ],
      ),
      floatingActionButton: _buildFloatingButton(context)
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: AppColor.primary,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(AssetsUtils.dpImage),
                ),
                SizedBox(height: 12),
                Text(
                  'Welcome, Sergio',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // print('Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: Text('Matches'),
            onTap: () {
              // print('Matches');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              // print('Setting');
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.matrimony),
      actionsPadding: EdgeInsets.all(8),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CommonRoutes.inbox);
          },
          icon: Icon(Icons.mark_as_unread_sharp),
        ),
        _buildProfileIcon(context),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      if (state is UserLoading){
        return Center(child: CircularProgressIndicator(),);
      }
      if (state is FetchUserState) {
        return Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(AssetsUtils.dpImage),
                    title: Text(state.users[index].name),
                    subtitle: Text(state.users[index].email),
                    trailing: Text(state.users[index].phone),
                  );
                },
              ),
            ),
          ),
        ],
      );
      }
      return Text("Loading...");
    },
  );
}


  Widget _buildCardWidget(BuildContext context) {
    return Card(
      elevation: 60.0,
      color: AppColor.cardcolor,
      child: SizedBox(
        height:  displayHeight(context) * 0.200,
        width: displayWidth(context) * 2.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                child: Text("Savings Account", style: TextStyle(
                  fontSize: 18,
                  color: AppColor.white,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: SizedBox(
                  width: displayWidth(context) * 0.100,
                  child: Image.asset(AssetsUtils.chip)),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.contactless_outlined, size: 40, color: AppColor.white,),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("5324-1742-9213-5284", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white
                ),)
              ),
              Text("valid: 01/27", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColor.white
              ),),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(title, style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white
                ),)
              ),
               Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.join_right_rounded, size: 60, color: AppColor.white,),
              )
            ],
          ),
          ],
        ),
      ),);
  }

  Widget _buildProfileIcon(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Stack(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AssetsUtils.dpImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.green,
            ),
            alignment: AlignmentDirectional(20, 140),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: (){
          Navigator.pushNamed(context, CommonRoutes.paymentInfo);
        }, child: Icon(Icons.add, color: AppColor.white,),);
  }
}
