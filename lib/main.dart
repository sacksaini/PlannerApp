import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimerState();
  }
}

class TimerState extends State<MyApp> {
  var increasetime = 0;
  void decreasTime() {
    setState(() {
      increasetime = 0;
    });
  }
//add a test comment
  void increasTime() {
    setState(() {
      increasetime = increasetime + 1;
      print(increasetime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Long Press Test",
                  style: TextStyle(
                    color: Colors.black,
                  ))),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text("Increment"),
                onPressed: increasTime,
                onLongPress: decreasTime,
              ),
              Text("$increasetime")
            ],
          ),
        ),
      ),
    );
  }
}
