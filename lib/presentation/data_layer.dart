import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:it_matrimony/core/services/api_services.dart';
import 'package:it_matrimony/model/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';




class FetchData extends ChangeNotifier {
  List<Post> posts = [];

  int counter = 0;

  Future<void> init () async {
    await fetchUser();
    await  _getInstance();
    await  _setPreference();
  }


  Future<void> fetchUser() async {
  final response = await ApiServices().getResponse("/posts");
  final repo = jsonDecode(response);
  // posts = repo.map<Post>((jsonItem) => Post.fromJson(jsonItem)).toList();
  posts = repo.map((listItem) => Post.fromJson(listItem)).toList();
  // repo.map<Post>((jsonItem) => Post.fromJson(jsonItem)).toList();
  
  counter = posts.length;


  notifyListeners();
  }

  Future<void> _setPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("cart_item", counter);
  }

  Future<void> _getInstance () async {
    SharedPreferences getPref = await SharedPreferences.getInstance();

    counter = getPref.getInt("cart_item") ?? 0;
    notifyListeners();
  }
}