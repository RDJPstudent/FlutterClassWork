import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/models/task_model.dart';

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
      backgroundColor: Colors.deepOrange,
      title:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Image.asset('Assets/rdplogo.png', height: 80),
        Text('Daily Planner', style: TextStyle(
          fontFamily: 'Caveat', fontSize: 52, color: Colors.blueGrey),
        )
        ],
      ) 
      ),
      drawer: Drawer(),
      body:
      Column(children: [
        TableCalendar(
          calendarFormat: CalendarFormat.month,
          focusedDay: DateTime.now(), //focus day is today
          firstDay: DateTime(2026),
          lastDay: DateTime(2027)
        ),
      ])
    );
  }
}
// basic bone 2
// Now we go to pubspec YAML and activate Flutter/Assets