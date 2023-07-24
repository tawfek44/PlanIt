
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_it/view/widgets/screen_header.dart';

import '../widgets/screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Stack(
            children: [
              ScreenHeader(),
              ScreenBody(),
            ],
          )


        ],
      )
    );
  }
}
