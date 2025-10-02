import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snackish/screens/homescreen.dart';
import 'package:snackish/screens/orderscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Portrait bleibt, Basta!
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => OrderScreen(),
      '/showorders': (context) => HomeScreen(), 
      // '/profile': (context) => ProfileScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


