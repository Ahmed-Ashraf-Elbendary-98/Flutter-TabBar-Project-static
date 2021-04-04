import 'package:flutter/material.dart';
import 'package:static_task/Appointment/appointment.dart';
import 'package:static_task/Appointment/newEvent.dart';
import 'package:static_task/Contacts/AddContact.dart';
import 'package:static_task/Notes/AddNotes.dart';
import 'package:static_task/Tasks/AddTask.dart';
import 'package:static_task/allTabs.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan[300]),
      debugShowCheckedModeBanner: false,
      initialRoute: AllTabs().tabsHome,

      routes: {
        AllTabs().tabsHome:(_)=>AllTabs(selectedPage: 0,),
        Appointment().appoint:(_)=> Appointment(),

        //?  Adds Section
        NewEvent().newEvent:(_)=>NewEvent(),
        AddContact().addcontact:(_)=> AddContact(),
        AddNote().addnote:(_)=>AddNote(),
        AddTask().addtask:(_)=>AddTask(),




      },
      
    );
  }
}