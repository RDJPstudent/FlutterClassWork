import 'dart:ffi';

import 'package:flutter/material.dart';
//provider is a service. Can be renamed as Services
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/task_model.dart';

class TaskProvider extends ChangeNotifier{
// references to database
// now we perform operations
final db = FirebaseFirestore.instance;
List<Task> tasks = []; //referencing task_model


// load task
Future<void> Load(String name) async {

try {
  //database part where we load persisted tasks
  final snapshot = await db.collection('tasks').get();

  //update local state, or load tasks locally
  tasks = snapshot.docs.map((doc)) => Task(
    //cast this to a list
    id: doc.id,
    title: doc['title'] ?? '',
    completed: doc['completed'] ?? false, // the ?? is important for erroring out
  ).toList();
  notifyListeners(); // the stateful change we are using to notify ^

} catch(err){
  print('Error: $err');
}

Future<void> add(String name) async{
try{
  if(name.trim().isNotEmpty){
  // trim gets rid of trailing and leading white space


  }
}catch(e){
  print('Error: $e');
}


}

}

}
