import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:scouts_flutter/home.dart';
import 'package:scouts_flutter/journey.dart';
import 'package:scouts_flutter/login.dart';
import 'package:scouts_flutter/main.dart';
import 'package:scouts_flutter/unit.dart';

class Badges extends StatefulWidget {
  const Badges({Key? key}) : super(key: key);

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  var tabid = 2;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1300;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);
    final signInBtnColorScheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 226, 209, 15),
        brightness: theme.brightness);
    return Scaffold(
        body: isDesktop(context)
            ? Column(
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
                            overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return signInBtnColorScheme.primaryContainer
                                    .withOpacity(0.08);
                              } else if (states
                                      .contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed)) {
                                return signInBtnColorScheme.primaryContainer
                                    .withOpacity(0.12);
                              }
                              return Colors.transparent;
                            }),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: signInBtnColorScheme.primary,
                                    width: 2),
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Text(
                            "Badges",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: (GridView.builder(
                                itemCount: userPerson!.progress.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 200,
                                  maxCrossAxisExtent: 200,
                                ),
                                itemBuilder: (context, index) {
                                  final badges = userPerson!.progress;
                                  return Card(
                                      child: InkWell(
                                    onTap: () {
                                      //show badge description and badge icon here
                                      showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                          child: Container(
                                            height: 600,
                                            width: 900,
                                            padding: const EdgeInsets.all(20),
                                            child: ListView(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .transparent),
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/cross.png',
                                                          height: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Spacer(),
                                                    Image.asset(
                                                      "assets/patrol/zetta.gif",
                                                      height: 200,
                                                      width: 200,
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          badges[index]
                                                              .badgeName,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displayLarge!
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary),
                                                        ),
                                                        LinearPercentIndicator(
                                                          width: 500.0,
                                                          lineHeight: 14.0,
                                                          animation: true,
                                                          animationDuration:
                                                              2000,
                                                          percent: 0.5,
                                                          barRadius:
                                                              const Radius
                                                                  .circular(20),
                                                          backgroundColor:
                                                              Colors.grey,
                                                          progressColor:
                                                              Colors.green,
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ),
                                                Text(
                                                  "REQUIREMENTS",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary),
                                                ),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: badges[index]
                                                      .requirements
                                                      .length,
                                                  itemBuilder:
                                                      (context, count) {
                                                    return Row(
                                                      children: [
                                                        const SizedBox(
                                                            width: 10),
                                                        Image.asset(
                                                            badges[index]
                                                                    .requirements[
                                                                        count]
                                                                    .completed
                                                                ? "assets/tick_mark.png"
                                                                : "assets/circle.png",
                                                            height: 25,
                                                            width: 25),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Text(
                                                              badges[index]
                                                                  .requirements[
                                                                      count]
                                                                  .requirement),
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                              'assets/patrol/zetta.gif'), // TODO: Replace with actual image
                                        ),
                                        const SizedBox(height: 10),
                                        Text(badges[index].badgeName),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ));
                                },
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    height: 50,
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/cross.png',
                            height: 20,
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
                            overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered)) {
                                return signInBtnColorScheme.primaryContainer
                                    .withOpacity(0.08);
                              } else if (states
                                      .contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed)) {
                                return signInBtnColorScheme.primaryContainer
                                    .withOpacity(0.12);
                              }
                              return Colors.transparent;
                            }),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: signInBtnColorScheme.primary,
                                    width: 2),
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
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  // Menu Bar Ends Here
                ],
              ));
  }
}
