import 'package:ChatApp/screens/auth_screen.dart';
import 'package:ChatApp/screens/chat_screen.dart';
import 'package:ChatApp/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.purple,
        accentColor: Colors.green,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.yellow,
          textTheme: ButtonTextTheme.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, usersnapshot) {
          if (usersnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (usersnapshot.hasData) {
            return ChatScreen();
          } else
            return AuthScreen();
        },
      ),
    );
  }
}
