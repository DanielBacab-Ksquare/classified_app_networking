import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:classified_app/models/user.dart';
import 'package:classified_app/models/ads.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:classified_app/utils/alert_manager.dart';


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
       var respObj = jsonDecode(resp.body);
       if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
       if (respObj['status'] == true) {
        AlertManager().displaySnackbar(context, 'Profile updated successfully');
      }
      

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

      var respObj = jsonDecode(resp.body);
       if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        AlertManager().displaySnackbar(context, 'Ad updated successfully');
      }
      

      Navigator.pushReplacementNamed(context, '/myads');
      
    } catch (e) {
      print(e);
    }
  }


}