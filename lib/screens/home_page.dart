import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final input = TextEditingController(); //This is a class, pre-defined. Captures INPUT.

  
  // now we must load tasks
    @override
    void initState(){
      super.initState(); //This is when something happens. We dictate that something.
      WidgetsBinding.instance.addPostFrameCallback((_)=> //binding widgets on init state
      
    //These decendents need to read. invoking functions in the Task Provider
      context.read<TaskProvider>().load()); //part of text provider package. Context-Read-Watch
    // the read will be RED SQUIGGLY if you: 

    }





  @override
  Widget build(BuildContext context) {
    final tp = context.watch<TaskProvider>(); //Monitors for change
      // We're using tp as TaskProvider



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
        ListView.builder( //horizontal or vertical list. Default is vertical
          shrinkWrap: true, //this container is scrollable becaue of this
          physics: NeverScrollableScrollPhysics(), //scrolling physics. Stops users from scrolling
          
          
          itemCount: tp.tasks.length, //The itemCount is the index
          itemBuilder: (context, i){
            final task = tp.tasks[i]; // the i is just the length; however long the task is
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
               ), // 8 pixels
                tileColor: i.isEven ? Colors.blue : Colors.green
              

              );

            
            

          })
      ])
    );
  }
}
// basic bone 2
// Now we go to pubspec YAML and activate Flutter/Assets

//listview builds the UI.
//Depending on how long the list is, the listview will build UI for dynamic lists.