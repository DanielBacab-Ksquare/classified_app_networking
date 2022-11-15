import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:classified_app/utils/constants.dart';

import 'package:classified_app/models/ads.dart';

class GetAllAds {
  Future<List<Ad>> fetchAdData() async {
    var url = Uri.parse("${Constants().serverUrl}/ads");
    List<Ad> ads = [];
    try {
      var res = await http.get(url);
      var resAsJSON = jsonDecode(res.body);
      var adData = resAsJSON['data'];
      
      ads = adData.map<Ad>((ad) => Ad.fromJson(ad)).toList();
      
      return ads;
    } catch (e) {
      print("Error $e");
      return ads;
    }
  }
}
