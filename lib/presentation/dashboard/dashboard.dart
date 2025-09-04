import 'package:flutter/material.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/constant/colors.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/assets_utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          _buildBody(context),
          _buildBody(context),
          _buildBody(context),
          _buildBody(context),
          _buildBody(context),
        ],
      ),
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
                      bottom: 24
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage(
                          AssetsUtils.dpImage
                        )
                      ),
                      SizedBox(height: 12,),
                      Text('Welcome, Sergio',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),),

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
            )
        ],
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context){
    return AppBar(
      title: Text(AppStrings.matrimony),
      actions: [
        IconButton(onPressed: () {
          Navigator.pushNamed(context, CommonRoutes.inbox);
        }, icon: Icon(Icons.mark_as_unread_sharp))
      ],
    );
  }


  Widget _buildBody(BuildContext context){
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(AssetsUtils.dpImage),
              title: Text('Leena'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('View Profile'),
                  onPressed: () {
                    /* ... */
                  },
                ),
              ],
            ),
          ],
        ),
      );
  }
}