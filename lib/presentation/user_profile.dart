import 'package:flutter/material.dart';
import 'package:it_matrimony/presentation/data_layer.dart';
import 'package:provider/provider.dart';

class UserProfileDetails extends StatefulWidget {
  const UserProfileDetails({super.key});

  @override
  State<UserProfileDetails> createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<FetchData>(context, listen: true).fetchUser());
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FetchData>(context);

    final post = provider.posts;

    // final post = context.watch<FetchData>().posts;
    return Consumer<FetchData>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            body: ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder:  (context, index) {
              return Text(post[index].title);
            },)
                ),
        ); 
      },
    );
  }
}
