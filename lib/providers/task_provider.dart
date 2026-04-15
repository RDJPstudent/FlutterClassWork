
import 'package:flutter/material.dart';
//provider is a service. Can be renamed as Services
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/task_model.dart';

class TaskProvider extends ChangeNotifier{
// references to database
// now we perform operations
final db = FirebaseFirestore.instance;
List<Task> tasks = []; //referencing task_model


// load task
// load task on initState
Future<void> load() async {

try {
  //database part where we load persisted tasks
  final snapshot = await db.collection('tasks').get();
  //^ this is Read of CRUD (Get)

  //update local state, or load tasks locally
  tasks = snapshot.docs.map((doc) => Task(
    //cast this to a list
    id: doc.id,
    title: doc['title'] ?? '',
    completed: doc['completed'] ?? false, // the ?? is important for erroring out
  )).toList();
  notifyListeners(); // the stateful change we are using to notify ^

} catch(err){
  print('Error: $err');
}

// add operator
Future<void> add(String title) async{
try{
  // Check if the name is empty of not
  if(title.trim().isEmpty) return; //This jumps out of execution flow
  // also called a "null-check"
  // trim gets rid of trailing and leading white space

  final ref = await db.collection('tasks').add({
    // This is the database operation
    // this adds to its fields
    'title': title,
    'completed': false,
    'timestamp': FieldValue.serverTimestamp(), //this can record time stamps

  });
  // we need to do the CRUD operator now to the database
  tasks.add(Task(id: ref.id, title: title, completed: false)); //Task is a class
  //TaskList is literally an array of tasks
  
  //We have a stateful change, so we must now NotifyListners
  notifyListeners();
}catch(e){
  print('Error: $e');
}
}
}

//The type is task. look below v
Future<void> update(int i, bool completed) async { //passing on the completed status and [i] for iteration

  try{
    // We now must update the database state using index and competed status
  await db.collection('tasks').doc(tasks[i].id).update({completed: completed});
    // updating field. Task done.
    //update the local state using same details
  tasks[i] = Task(id: tasks[i].id, title: tasks[i].title, completed: completed);
     // Now we notifyListeners because of the Stateful Change
     notifyListeners();
  } catch(error){
    print('Error: $error');
  }

}


Future<void> delete(int i) async{
  try{
    //deelte task from Firestore using Index
    await db.collection('tasks').doc(tasks[i].id).delete(); ///Deletes Task from FireStore

    //delete task fro mlocal task object using index
    tasks.removeAt(i); //remove at index position
    notifyListeners();
  }catch(e){
    print('Error: $e');
  }
}
}

//State management is a higher-tier concept to learn. Get good at it!!!!
