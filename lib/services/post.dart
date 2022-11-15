import 'dart:convert';
import 'package:classified_app/models/fetchuser.dart';
import 'package:classified_app/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

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
    print(resp.statusCode);
    if (resp.statusCode == 401) {
      print("fetchMyuser is unauthorized");
    }
    print(resp.body);
    var respJson = jsonDecode(resp.body);

    var postData = respJson['data'];
    user = postData;

    print("Pasa esto: $user");
    return user;
  }
}
