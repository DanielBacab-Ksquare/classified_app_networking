import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:classified_app/styles/theme.dart';
import 'package:classified_app/router_generator.dart';
import 'screens/home_screen.dart';

main() {
   var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      home: HomeScreen(),
      initialRoute: "/login",
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
