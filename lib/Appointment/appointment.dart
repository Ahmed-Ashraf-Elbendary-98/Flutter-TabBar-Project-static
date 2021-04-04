import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:static_task/Appointment/newEvent.dart';
import 'package:static_task/allTabs.dart';


class Appointment extends StatefulWidget {
  final String appoint = "/appoint";


  @override
  _AppointmentState createState() => _AppointmentState();
}

DateTime now = new DateTime.now();
bool processDone = false;


class _AppointmentState extends State<Appointment> {
//! -------------------------------------------
  //TODO use these  for real project!!
  DateTime _currentDate = DateTime(now.year, now.month, now.day);
  DateTime _currentDate2 = DateTime(now.year, now.month, now.day);
  String _currentMonth =
      DateFormat.yMMM().format(DateTime(now.year, now.month, now.day));
  DateTime _targetDateTime = DateTime(now.year, now.month, now.day);

//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = new Container(
    //TODOcustomize an icon for all events
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.teal,
    ),
  );


  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 4, 10): [
        new Event(
          date: new DateTime(2021, 4, 10),
          title: 'Event 1',
          icon: _eventIcon, //? customized icon we already created
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2021, 4, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2021, 4, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],

      new DateTime(2021, 4, 20): [
        new Event(
          date: new DateTime(2021,  4, 20),
          title: 'Event 1',
          icon: _eventIcon, //? customized icon we already created
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2021,  4, 20),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2021,  4, 20),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],

    },
  );

  List result;
  @override
  void initState() {

    _markedDateMap.addAll(new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day), [
      //! 3 events in 2/11/2019
      new Event(
        date: new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);


    /// Add more events to _markedDateMap EventList
    super.initState();
  }




//! -------------------------------------------
  // print("hi -----:> ${helper.allEvents()} ");
  @override
  Widget build(BuildContext context) {
    String _comingTitle = '';
//?-------------------------------------------

    //TODO Example Calendar Carousel "without header" and custom prev & next button
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.grey,
      onDayPressed: (date, events) {

        print(
            'long pressed date $date => year: ${date.year}  month: ${date.month}  day:${date.day}   ');
        this.setState(() { _currentDate2 = date; });
        events.forEach((event) => print(event.title));
        events.length == 0 ? "" : _displayEvents(events);

      },
      daysHaveCircularBorder: false, //TODO to make dayes Rectangle
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey, //TODO color of  Rectangle
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: //TODO days that has events
          RoundedRectangleBorder(side: BorderSide(color: Colors.teal)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      markedDateShowIcon: false,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      selectedDayButtonColor: Colors.teal,
      todayButtonColor: Colors.greenAccent,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        _askToAdd(date);
      },



    );
  setState(() {});
//?-------------------------------------------
    return SingleChildScrollView(

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //?custom icon without header
                    Container(
                      margin: EdgeInsets.only(
                        top: 30.0,
                        bottom: 16.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            child: Icon(
                              Icons.chevron_left, // PREV
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _targetDateTime = DateTime(_targetDateTime.year,
                                    _targetDateTime.month - 1);
                                _currentMonth =
                                    DateFormat.yMMM().format(_targetDateTime);
                              });
                            },
                          ),
                          Text(
                            _currentMonth,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                          FlatButton(
                            child: Icon(Icons.chevron_right,
                                color: Theme.of(context).primaryColor), // NEXT
                            onPressed: () {
                              setState(() {
                                _targetDateTime = DateTime(_targetDateTime.year,
                                    _targetDateTime.month + 1);
                                _currentMonth =
                                    DateFormat.yMMM().format(_targetDateTime);
                              });
                            },
                          )
                        ],
                      ),
                    ),

                    //* the actual calender
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: _calendarCarouselNoHeader,
                    ), //
                  ],
                )
            );

  }

  void _displayEvents(List<Event> evelist) {
    print(evelist.length);
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            // color: Colors.amber,
            color: Color(0xFF737373),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: _buildWidget(evelist),
            ),
          );
        });
  }

  Widget _buildWidget(myList) {
    return Column(children: [
      SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF737373).withOpacity(0),
                    child: Icon(
                      Icons.info,
                      color: Colors.blue,
                      size: 45,
                    ),
                  ),
                  title: Text("Title is ${myList[index].title}"),
                ),
              );
            }),
      ),
      // ListTile(
      //   leading: Text("Title Here"),
      // ),
    ]);
  }

//Todo make add new note in another widget
  void _askToAdd(DateTime date) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(" New Event ?"),
            // Text(
            // "Add new Note in ${date.year}/ ${date.month} / ${date.day} ?"),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  Text("Do you want to ADD a new Event ? "),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () async {
                          processDone = false;
                          Navigator.pop(context);
                          await Navigator.pushNamed(
                              context, NewEvent().newEvent,
                              arguments: date);
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                (Colors.greenAccent[400]))),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                (Colors.redAccent))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
