import 'package:flutter/material.dart';
import 'package:scouts_flutter/badges.dart';
import 'package:scouts_flutter/journey.dart';
import 'package:scouts_flutter/main.dart';
import 'package:scouts_flutter/unit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Unit()),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Badges()),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Journey()),
                    );
                  },
                  child: Text(
                    "MY SCOUTING JOURNEY",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          // Menu Bar Ends Here
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    userPerson!.name,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "SST Fearless Falcons Unit, Patrol ${userPerson!.patrol}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 50),
                  //Badges
                  Text(
                    "ACHIEVEMENTS",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount: 3,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 150,
                              maxCrossAxisExtent: 500,
                            ),
                            itemBuilder: (context, index) {
                              final achievements = userPerson!.progress;
                              return Container(
                                padding: const EdgeInsets.all(10),
                                child: Card(
                                  child: Row(children: [
                                    const SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                          'assets/patrol/zetta.gif'), // TODO: Replace with actual image
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(achievements[index].badgeName),
                                        const SizedBox(height: 20),
                                        Text(
                                            achievements[index].dateCompletion),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // BADGES
                  Text(
                    "BADGES",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                          child: GridView.builder(
                            itemCount: 2,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent: 150,
                              maxCrossAxisExtent: 500,
                            ),
                            itemBuilder: (context, index) {
                              final progress = userPerson!.progress;
                              return Container(
                                padding: const EdgeInsets.all(10),
                                child: const Card(
                                  child: Text("Hi")
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
