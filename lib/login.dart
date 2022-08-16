import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scouts_flutter/theme.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> initiateLogin() async {
    final user =
        await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    if (user.user != null) {
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

    final email = user.user!.email;
    // Get spreadsheet data, navigate to home page
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.jpg",
              height: 250,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "To get started, please sign in with your school Gmail account.",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            InkResponse(
                child: SvgPicture.asset(
                  "assets/glogo.svg",
                  height: 50,
                ),
                onTap: initiateLogin)
          ],
        ),
      )),
    );
  }
}
