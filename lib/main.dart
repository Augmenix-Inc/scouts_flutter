import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scouts_flutter/firebase_options.dart';
import 'package:scouts_flutter/login.dart';
import 'package:scouts_flutter/theme.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // For debugging purposes, set persistence to tab/session only
  FirebaseAuth.instance.setPersistence(Persistence.SESSION);

  // Show login page if not logged in
  if (FirebaseAuth.instance.currentUser == null) {
    runApp(MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Login(),
    ));
    return;
  }

  // Handle logged in situation
  runApp(MaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    home: const Login(),
  ));
}
