import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/my_ads_screen.dart';
import 'screens/register_screen.dart';
import 'screens/create_ad_screen.dart';
import 'screens/edit_ad_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/image_viewer_screen.dart';

class RouteGenerator {
  var generateRoute = ((settings) {
    var routeName = settings.name;
    var args = settings.arguments;
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/login':
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case '/settings':
        return MaterialPageRoute(builder: (context) => SettingsScreen());

      case '/editprofile':
        return MaterialPageRoute(builder: (context) => EditProfileScreen());

      case '/myads':
        return MaterialPageRoute(builder: (context) => MyAdsScreen());

      case '/register':
        return MaterialPageRoute(builder: (context) => RegisterScreen());

      case '/createad':
        return MaterialPageRoute(builder: (context) => CreateAdScreen());

      case '/editad':
        return MaterialPageRoute(
            builder: (context) => EditAdScreen(productToEdit: args));

      case '/productdetail':
        return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productToDisplay: args));

      case '/imageviewer':
        return MaterialPageRoute(
            builder: (context) => ImageViewerScreen(images: args));
    }
  });
}
