import 'package:flutter/material.dart';
import 'package:scouts_flutter/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Menu Bar -> Shift to a widgets so that it can be reused
            Container(
              color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).textTheme.button!.color),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("BADGES"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("MY SCOUTING JOURNEY"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text("Home"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
