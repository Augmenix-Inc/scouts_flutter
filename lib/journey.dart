import 'package:flutter/material.dart';
import 'package:scouts_flutter/badges.dart';
import 'package:scouts_flutter/home.dart';
import 'package:scouts_flutter/login.dart';
import 'package:scouts_flutter/main.dart';
import 'package:scouts_flutter/unit.dart';

class Journey extends StatefulWidget {
  const Journey({Key? key}) : super(key: key);

  @override
  State<Journey> createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  var tabid = 3;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final signInBtnColorScheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 226, 209, 15),
        brightness: theme.brightness);
    return Scaffold(
      body: Column(
        children: [
          // Menu Bar -> Shift to a widgets so that it can be reused
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            height: 50,
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  fit: BoxFit.cover,
                  height: 40,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    tabid == 0
                        ? null
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                  },
                  child: Text(
                    "HOME",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    tabid == 1
                        ? null
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Unit()),
                          );
                  },
                  child: Text(
                    "UNIT",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    tabid == 2
                        ? null
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Badges()),
                          );
                  },
                  child: Text(
                    "BADGES",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    tabid == 3
                        ? null
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Journey()),
                          );
                  },
                  child: Text(
                    "JOURNEY",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await googleSignIn.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                        (route) => false);
                  },
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
                      ),
                    ),
                  ),
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                      color: signInBtnColorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Menu Bar Ends Here
        ],
      ),
    );
  }
}
