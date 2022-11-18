import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:classified_app/models/user.dart';
import 'package:classified_app/models/ads.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class PatchService{
void updateProfile(context, UserModel user) async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("${Constants().serverUrl}/user/");
    var token = await storage.read(key: 'token');

    var userObj = user.toJson();
    try {
      var resp = await http.patch(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      

      Navigator.pushReplacementNamed(context, '/settings');
      
    } catch (e) {
      print(e);
    }
  }

  void updateAd(context, Ad ad, String id) async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("${Constants().serverUrl}/ads/$id");
    var token = await storage.read(key: 'token');

    var userObj = ad.toJson();
    try {
      var resp = await http.patch(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      

      Navigator.pushReplacementNamed(context, '/myads');
      
    } catch (e) {
      print(e);
    }
  }


}