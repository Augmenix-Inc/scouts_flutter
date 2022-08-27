import 'package:flutter/material.dart';
import 'package:scouts_flutter/badges.dart';
import 'package:scouts_flutter/main.dart';

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
                  onPressed: () {},
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
                  onPressed: () {},
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

          Container(
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

                // Achievements
                Text(
                  "Achievements",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      height: 275,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Spacer(),
                          Text(
                            "Add Image here",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Text(
                            "Filler 1",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 275,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Spacer(),
                          Text(
                            "Add Image here",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Text(
                            "Filler 1",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 275,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Spacer(),
                          Text(
                            "Add Image here",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Text(
                            "Filler 1",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
