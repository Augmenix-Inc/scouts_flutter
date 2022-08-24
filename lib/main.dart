import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:scouts_flutter/firebase_options.dart';
import 'package:scouts_flutter/home.dart';
import 'package:scouts_flutter/login.dart';
import 'package:scouts_flutter/theme.dart';
import 'package:scouts_flutter/utilities/classes/mainsheet.dart';
import 'package:scouts_flutter/utilities/classes/person.dart';
import 'package:scouts_flutter/utilities/driveutils.dart';

final googleSignIn = GoogleSignIn(
  scopes: [drive.DriveApi.driveReadonlyScope],
);
late final Person userPerson;

Future<void> initApp() async {
  // Initialise Google Drive API
  await DriveUtils.initializeDrive();

  // Download main sheet
  final mainSheet = MainSheet();
  await mainSheet.initUserSheets();

  // Get person details for user
  // TODO: using richard's email temporarily
  userPerson = await mainSheet.getPersonWithEmail("tan_yu_zhe_richard@s2020.ssts.edu.sg");
}

void main() async {
  await googleSignIn.signIn();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // For debugging purposes, set persistence to tab/session only
  FirebaseAuth.instance.setPersistence(Persistence.SESSION);

  // Show login page if not logged in
  if (googleSignIn.currentUser == null) {
    runApp(MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Login(),
    ));
    return;
  }

  // Initialise drive and download main sheet
  await initApp();

  // Handle logged in situation
  runApp(MaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    home: const Home(),
  ));
}
