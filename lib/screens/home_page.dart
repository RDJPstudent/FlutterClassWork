import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    appBar: AppBar(
      title:
      Row(
        children: [
        Image.asset('Assets/rdplogo.png', height: 80),
        Text('Daily Planner', style: TextStyle(
          fontFamily: 'Caveat'),
        )
        ],
      ) 
      )
    );
  }
}
// basic bone 2
// Now we go to pubspec YAML and activate Flutter/Assets