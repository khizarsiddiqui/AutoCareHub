import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechanics_mangao/routes.dart';
import 'package:mechanics_mangao/screens/splash/splash_screen.dart';
import 'package:mechanics_mangao/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBnXU9KwVxePSpGNM4tVRZwVNR8YdPyj6U",
          appId: "1:54203721180:android:236b0564779c7bf452db19",
          messagingSenderId: "54203721180",
          projectId: "mechanics-mangao-24d0d",
          authDomain: "mechanics-mangao-24d0d.firebaseapp.com",
          storageBucket: "mechanics-mangao-24d0d.appspot.com"));
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Care Hub',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we don't need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
