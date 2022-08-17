import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart';
import 'package:scouts_flutter/authenticated_client.dart';
import 'package:scouts_flutter/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> initiateLogin() async {
    final googleSignIn = GoogleSignIn(
      scopes: [drive.DriveApi.driveReadonlyScope],
    );

    final user = await googleSignIn.signIn();

    if (user == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error signing in"),
                content: const Text(
                    "An unexpected error has occured while signing in with Google, please try again."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Continue")),
                  TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await initiateLogin();
                      },
                      child: const Text("Try again"))
                ],
              ));
      return;
    }

    // Temporary: will be moved somewhere soon
    final authHeaders = await user.authHeaders;
    final baseClient = Client();
    final authenticateClient = AuthenticateClient(authHeaders, baseClient);
    final driveApi = drive.DriveApi(authenticateClient);
    final drive.Media test_file = (await driveApi.files.export(
        "1EOGux-SMx0-bKr9pPRdcqg4YZ5Mm13KNv3U5vXTKbRc", "text/csv",
        downloadOptions: drive.DownloadOptions.fullMedia)) as drive.Media;

    // Get spreadsheet data, navigate to home page
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signInBtnColorScheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 226, 209, 15),
        brightness: theme.brightness);

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The Stacked Portal",
              style: theme.textTheme.displayLarge!
                  .copyWith(color: theme.colorScheme.primary)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Image.asset(
              "assets/logo.jpg",
              height: 250,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "To get started, login with your School's Gmail account.",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: initiateLogin,
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return signInBtnColorScheme.primaryContainer
                            .withOpacity(0.08);
                      } else if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed)) {
                        return signInBtnColorScheme.primaryContainer
                            .withOpacity(0.12);
                      }
                      return Colors.transparent;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: signInBtnColorScheme.primary, width: 2),
                    ))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/gdrivelogo.svg",
                      height: 18,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Sign in with Google Drive",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: signInBtnColorScheme.primary),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
