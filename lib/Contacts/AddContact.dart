

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:static_task/allTabs.dart';



class AddContact extends StatefulWidget {
  final String addcontact = "/cont";
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String _name;
  String _imgUrl="https://variety.com/wp-content/uploads/2020/11/joe-biden-1.jpg?w=681&h=383&crop=1";
  int _phone;



  @override
  void initState() {
;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact"),),
      body:SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                MyField(hint: "Enter The Person Name",lable: "Name",type: TextInputType.text,
                  onChangedFunc:(newVal){setState(() {
                  setState(() {
                    _name=newVal;
                  });
                });},),
                MyField(enabled:false,initVal:"https://variety.com/wp-content/uploads/2020/11/joe-biden-1.jpg?w=681&h=383&crop=1",hint: "",lable: "Image Url",type: TextInputType.text,),

                MyField(hint: "Enter The Person Phone",lable: "Phone",type: TextInputType.phone,
                  onChangedFunc:(newVal){setState(() {
                    setState(() {
                      _phone=int.parse(newVal);
                    });
                  });},
                ),

              RaisedButton.icon(onPressed: ()async{

                _showError();


                }, icon: Icon(Icons.add), label: Text("Save"))
              ],
            ),
          )) ,
    );
  }

  void _showError(){
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("How? 🤔"),
        content: Container(
          height: 125,
          child: Column(
            children: [
              Text("Sorry we can't store any data right now, Please keep following the newest updates "),
              TextButton.icon(onPressed: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AllTabs(
                          selectedPage: 1,
                        )),
                      (route)=>false,
                );
              }, label: Text("Ok"),
                  icon:Icon(Icons.arrow_back_sharp) ,

        )
            ],
          ),
        ),

      );
    });
  }

}

class MyField extends StatefulWidget {

  String hint;
  String lable;
  bool enabled;
  String initVal;
  TextInputType type;
  Function onChangedFunc;

  MyField({this.hint,this.lable,this.type,this.onChangedFunc,this.enabled,this.initVal});

  @override
  _MyFieldState createState() => _MyFieldState();
}

class _MyFieldState extends State<MyField> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        initialValue: widget.initVal,
        enabled: widget.enabled,
        // enableInteractiveSelection: false,
        focusNode: FocusNode(),
        keyboardType:widget.type,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.lable,
          border:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          )
        ),
        onChanged:widget.onChangedFunc

      ),
    );
  }
}
