import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_matrimony/core/constant/app_strings.dart';
import 'package:it_matrimony/core/routes/routes.dart';
import 'package:it_matrimony/core/utils/assets_utils.dart';
import 'package:it_matrimony/presentation/inbox/bloc/inbox_bloc.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.inboxHeading),
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, CommonRoutes.dashboard);
    
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: _getListName(context),
    );
  }


  Widget _getListName(BuildContext context) {
    return BlocBuilder<InboxBloc, InboxState>(
      builder: (context, state) {
        if (state is InboxLoading) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (state is FetchInboxChat){

          return ListView.builder(
          itemCount: state.inbox.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(AssetsUtils.dpImage),
                  ),
                  title: Text(state.inbox[index].username),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                ),
                Divider(
                  indent: 8,
                  endIndent: 8,
                )
              ],
            );
          },
          );
        }
        return Text("SomeThingwent Wrog");
      },
    );
  }
}