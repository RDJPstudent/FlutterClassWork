import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 20),
                  FlutterLogo(),
                  SizedBox(width: 180),
                  Icon(Icons.notification_add),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(child: null),
        body: Center(
          child: Text("This is a test", style: TextStyle(fontSize: 42)),
        ),
      ),
    );
  }
}
