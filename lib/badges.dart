import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:scouts_flutter/home.dart';
import 'package:scouts_flutter/login.dart';
import 'package:scouts_flutter/main.dart';

class Badges extends StatefulWidget {
  const Badges({Key? key}) : super(key: key);

  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  var tabid = 2;
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
                        ? print("Im in home")
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Badges()),
                    );
                  },
                  child: Text(
                    "Badges",
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
                        .copyWith(color: Theme.of(context).colorScheme.primary),
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
                                          height: 400,
                                          width: 400,
                                          color: Colors.red,
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
                                                        Navigator.pop(context);
                                                      },
                                                      child: SvgPicture.asset(
                                                        "assets/close_x.svg",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        badges[index].badgeName,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary),
                                                      ),
                                                      Text(badges[index]
                                                                  .dateCompletion !=
                                                              '-'
                                                          ? "You acquired on ${badges[index].dateCompletion}"
                                                          : "You do not have this badge"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "REQUIREMENTS",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                              ),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: badges[index]
                                                    .requirements
                                                    .length,
                                                itemBuilder: (context, count) {
                                                  return Row(
                                                    children: [
                                                      SvgPicture.asset(badges[
                                                                  index]
                                                              .requirements[
                                                                  count]
                                                              .completed
                                                          ? "assets/tick_mark.svg"
                                                          : "assets/circle.svg"),
                                                      Text(badges[index]
                                                          .requirements[count]
                                                          .requirement)
                                                    ],
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
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
      ),
    );
  }
}
