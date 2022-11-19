import 'dart:convert';

import 'package:classified_app/models/user.dart';
import 'package:classified_app/utils/alert_manager.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  void register(context, UserModel user) async {
    var storage = FlutterSecureStorage();

    var url = Uri.parse("${Constants().serverUrl}/auth/register");
    var url2 = Uri.parse("${Constants().serverUrl}/auth/login");

    var userObj = user.toJson();
    try {
      var resp = await http.post(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
      });
      var respObj = jsonDecode(resp.body);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        AlertManager().displaySnackbar(context, 'Successful registration');

        try {
          var resp2 =
              await http.post(url2, body: jsonEncode(userObj), headers: {
            'Content-Type': 'application/json',
          });
          var respObj2 = jsonDecode(resp2.body);
          if (respObj2['status'] == true) {
            storage.write(
                key: 'userId', value: respObj2['data']['user']['_id']);
            storage.write(key: 'token', value: respObj2['data']['token']);
            Navigator.pushReplacementNamed(context, '/');
          }
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void login(context, UserModel user) async {
    var storage = FlutterSecureStorage();
    var url = Uri.parse("${Constants().serverUrl}/auth/login");

    var userObj = user.toJson();
    try {
      var resp = await http.post(url, body: jsonEncode(userObj), headers: {
        'Content-Type': 'application/json',
      });
      var respObj = jsonDecode(resp.body);
      //print(respObj);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        AlertManager().displaySnackbar(context, 'Successful login');
        storage.write(key: 'userId', value: respObj['data']['user']['_id']);
        storage.write(key: 'token', value: respObj['data']['token']);
        Navigator.pushReplacementNamed(context, '/');
      }
    } catch (e) {
      print(e);
    }
  }
}
