import 'package:flutter/material.dart';
import 'package:static_task/Appointment/appointment.dart';
import 'package:static_task/Contacts/AddContact.dart';
import 'package:static_task/Contacts/contacts.dart';
import 'package:static_task/Notes/AddNotes.dart';
import 'package:static_task/Notes/notes.dart';
import 'package:static_task/Tasks/AddTask.dart';
import 'package:static_task/Tasks/tasks.dart';

class AllTabs extends StatefulWidget {
  final String tabsHome = "/home";
  int selectedPage;
  AllTabs({this.selectedPage});

  @override
  _AllTabsState createState() => _AllTabsState();
}

class _AllTabsState extends State<AllTabs>  with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.selectedPage); //? initialIndex:0
    _tabController.addListener(_handleTabIndex);


  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.selectedPage,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Book",style: TextStyle(color: Colors.white),),
            bottom: TabBar(
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 15.0,fontFamily: 'Family Name',color: Colors.white),
              controller: _tabController,
              tabs: [
                Tab( // Tab 0
                  text:"Appointment",
                  icon: Icon(Icons.date_range,color: Colors.white,),
                ),
                Tab(// Tab 1
                  text: "Contacts",
                  icon: Icon(Icons.portrait,color: Colors.white,),
                ),
                Tab( // Tab 2
                  text: "Notes",
                  icon: Icon(Icons.insert_drive_file,color: Colors.white,),
                ),
                Tab( // Tab 3
                  text: "Tasks",
                  icon: Icon(Icons.assignment_turned_in,color: Colors.white,),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Appointment(),
              Contacts(),
              Notes(),
              Tasks(),
            ],
          ),
          floatingActionButton: _bottomButtons(),
        )

    );
  }
  Widget _bottomButtons() {

    if(_tabController.index==0){
      return FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){

          }, // add new Event
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            size: 20.0,
          ));
    }

    else if(_tabController.index==1){
      return  FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){
            Navigator.pushNamed(context, AddContact().addcontact);
          }, // add new contact
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            size: 20.0,
          ));
    }
    else if(_tabController.index==2){
      return FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: (){
          Navigator.pushNamed(context, AddNote().addnote);
        }, // add new note
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 20.0,
        ),
      );
    }
    else if(_tabController.index==3){
      return FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: (){
          Navigator.pushNamed(context, AddTask().addtask);
        }, // add new task
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 20.0,
        ),
      );
    }



  }


}



