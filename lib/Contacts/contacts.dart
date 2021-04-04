import "package:flutter/material.dart";

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyCard(name:"John" ,phone:"555-555-5555",imgUrl:"https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg" ,),
        MyCard(name:"Alan" ,phone:"555-800-8995",imgUrl:"https://www.iciw.com/bilder/artiklar/10230-002.jpg?m=1572860973",),
        MyCard(name:"Kean",phone:"555-795-7342" ,imgUrl:"https://image.freepik.com/free-photo/portrait-handsome-young-man-with-crossed-arms_176420-15569.jpg",),
        MyCard(name:"Harry",phone:"555-365-4545" ,imgUrl:"https://wp-media.patheos.com/blogs/sites/416/2015/07/Young-Man-Laugh.jpg",),
        MyCard(name:"Tomas",phone:"555-231-1212" ,imgUrl:"https://deathofhemingway.com/wp-content/uploads/2020/12/istockphoto-1045886560-612x612-1.jpg",),
      ],
    );
  }
}

class MyCard extends StatelessWidget {

  String name;
  String imgUrl;
  String phone;

  MyCard({this.name,this.imgUrl,this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:CircleAvatar(backgroundImage:NetworkImage(imgUrl)),
        // NetworkImage(imgUrl),
        title: Text(name),
        subtitle: Text("${phone}"),
        ),
    );
  }
}

