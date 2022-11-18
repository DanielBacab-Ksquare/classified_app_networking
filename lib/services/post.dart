import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:classified_app/models/ads.dart';
import 'package:classified_app/utils/alert_manager.dart';

class PostService {
  Future<Map> fetchMyUser() async {
    var storage = FlutterSecureStorage();
    Map user;
    var url = Uri.parse("${Constants().serverUrl}/user/profile");
    var token = await storage.read(key: 'token');
    // try {
    var resp = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
   
    if (resp.statusCode == 401) {
      print("fetchMyuser is unauthorized");
    }
    
    var respJson = jsonDecode(resp.body);
   

    var postData = respJson['data'];
    user = postData;

    print("Pasa esto: $user");
    return user;
  }

  //my ads
  Future<List<Ad>> fetchMyAdData() async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("${Constants().serverUrl}/ads/user");
     var token = await storage.read(key: 'token');
    List<Ad> ads = [];
    try {
      var res = await http.post(url,headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      var resAsJSON = jsonDecode(res.body);
      
      
      var adData = resAsJSON['data'];
      
      ads = adData.map<Ad>((ad) => Ad.fromJson(ad)).toList();
      
      return ads;
    } catch (e) {
      print("Error $e");
      return ads;
    }
  }


  void createAd(context, Ad ad) async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("${Constants().serverUrl}/ads");
    var token = await storage.read(key: 'token');

    var userObj = ad.toJson();
    try {
      var resp = await http.post(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
       var respObj = jsonDecode(resp.body);
       if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        AlertManager().displaySnackbar(context, 'Ad successfully created');
      }
      

      Navigator.pushReplacementNamed(context, '/');
      
    } catch (e) {
      print(e);
    }
  }





}
