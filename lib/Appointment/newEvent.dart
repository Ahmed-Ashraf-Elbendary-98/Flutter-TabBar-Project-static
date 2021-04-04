import 'package:flutter/material.dart';
import 'package:static_task/allTabs.dart';



class NewEvent extends StatefulWidget {
  final String newEvent = "/newevent";
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  String _titleOfEvent = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime myDate = ModalRoute.of(context).settings.arguments;
    print(myDate);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new Event"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 128.0, left: 18.0, right: 18.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Event",
                    hintText: "Please Enter an Event ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                keyboardType: TextInputType.text,
                onChanged: (newVal) {
                  setState(() {
                    _titleOfEvent = newVal;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextField(
                    lable: "Year",
                    hint: "Year",
                    numberDate: myDate.year,
                  ),
                  MyTextField(
                    lable: "Month",
                    hint: "Month",
                    numberDate: myDate.month,
                  ),
                  MyTextField(
                    lable: "Day",
                    hint: "Day",
                    numberDate: myDate.day,
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              OutlineButton.icon(
                  label: Text(
                    "Save",
                    style: TextStyle(fontSize: 20),
                  ),
                  borderSide: BorderSide(color: Colors.green),
                  icon: Icon(
                    Icons.create_outlined,
                    size: 20,
                  ),
                  onPressed: () async {

                    _showError();

                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)))
            ],
          )),
        ),
      ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AllTabs(
                          selectedPage: 0,
                        )),
                          (route)=>false

                   );

                }, label: Text("Ok"),
                  icon:Icon(Icons.arrow_back_sharp) ,

                ),
              )
            ],
          ),
        ),

      );
    });
  }

}

class MyTextField extends StatelessWidget {
  String lable = "";
  String hint = "";
  int numberDate = 0;
  MyTextField({this.lable, this.hint, this.numberDate});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: TextFormField(
        initialValue: "$numberDate",
        focusNode: FocusNode(),
        enableInteractiveSelection: false,
        showCursor: false,
        readOnly: true,
        decoration: InputDecoration(
            labelText: lable,
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
