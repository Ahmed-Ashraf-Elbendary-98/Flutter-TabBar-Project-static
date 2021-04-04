
import 'package:flutter/material.dart';


class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {

  bool checkedValue=false;
  DateTime date;

  @override
  void initState() {
    date=DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          MyTaskList(title:"Write some code with Flutter framework",text: "${date.year}/${date.month}/${date.day}",done: checkedValue,),
          MyTaskList(title:"Learn .Net 5.0",text: "${date.year}/${date.month}/${date.day}",done: checkedValue,),
          MyTaskList(title:"Learn Python",text: "${date.year}/${date.month+1}/${date.day}",done: checkedValue,),
          ]);
    }



 void _showMessage(){
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("How? and Why? 🤯"),
        content: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("How can you Edit things that are already done?"),
              TextButton.icon(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back), label: Text("Back"))
            ],

          ),
        ),
      );
    });
  }
}


class MyTaskList extends StatefulWidget {
  bool done;
  String title;
  String text;

  MyTaskList({this.title,this.text,this.done});

  @override
  _MyTaskListState createState() => _MyTaskListState();
}

class _MyTaskListState extends State<MyTaskList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(widget.title ,style: TextStyle(decoration:widget.done? TextDecoration.lineThrough:TextDecoration.none)),
      subtitle:Text(widget.text , style: TextStyle(decoration:widget.done? TextDecoration.lineThrough:TextDecoration.none)) ,

      leading: Checkbox(
        value: widget.done,
        onChanged: (newVal)async{
          setState(() {
            print("Changed");
            widget.done=newVal;
          });
        },
      ),
    );
  }
}


