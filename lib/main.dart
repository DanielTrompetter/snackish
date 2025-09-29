import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snackish/screens/homescreen.dart';

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
      '/home': (context) => HomeScreen(),
      // '/showpicture': (context) => BigPictureScreen(), 
      // '/profile': (context) => ProfileScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


