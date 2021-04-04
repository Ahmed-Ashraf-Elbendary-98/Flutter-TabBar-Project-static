import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyNote(title:"What is Lorem Ipsum?",text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
        MyNote(title:"Why do we use it?",text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
        MyNote(title:"Where does it come from?",text: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC"),

      ],
    );
  }
}

class MyNote extends StatelessWidget {

  String title;
  String text;

  MyNote({this.title,this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                  offset: Offset(2,4),
                  color: Colors.teal,
                  blurRadius: 6,
                  spreadRadius: 1
              ),],
            color: Colors.teal
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title:Text(title,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),),
            subtitle: Text(text,style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
