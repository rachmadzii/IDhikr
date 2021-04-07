import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Dhikr/asmaul_husna.dart';
import 'package:Dhikr/dzikir_pagi.dart';
import 'package:Dhikr/dzikir_petang.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhikr',
      theme: ThemeData(primaryColor: Colors.blueGrey[300]),
      home: MyHomePage(title: 'Dhikr'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(40.0)),
                    color: Colors.blueGrey[800]),
              ),
              Positioned(
                  top: 30.0,
                  right: 35.0,
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.mood, color: Colors.white),
                      onPressed: () {
                        print("Button clicked");
                      },
                    ),
                  ])),
              Positioned(
                top: 40.0,
                left: 25.0,
                child: Text(
                  "DHIKR-I",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 3.0),
                ),
              ),
              Positioned(top: 100.0, child: Column()),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AsmaulHusna()));
                },
                child: Container(
                    height: 70.0,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[400],
                        borderRadius: BorderRadius.only(
                            topRight: (Radius.circular(35.0)),
                            bottomRight: (Radius.circular(35.0)))),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Icon(Icons.format_quote, color: Colors.white),
                        SizedBox(width: 20.0),
                        Text(
                          "ASMAUL HUSNA",
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        )
                      ],
                    )),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DzikirPagi()));
                },
                child: Container(
                    height: 70.0,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[400],
                        borderRadius: BorderRadius.only(
                            topRight: (Radius.circular(35.0)),
                            bottomRight: (Radius.circular(35.0)))),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Icon(Icons.wb_sunny, color: Colors.white),
                        SizedBox(width: 20.0),
                        Text(
                          "DZIKIR PAGI",
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        )
                      ],
                    )),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => DzikirPetang()));
                },
                child: Container(
                    height: 70.0,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[400],
                        borderRadius: BorderRadius.only(
                            topRight: (Radius.circular(35.0)),
                            bottomRight: (Radius.circular(35.0)))),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Icon(Icons.brightness_3, color: Colors.white),
                        SizedBox(width: 20.0),
                        Text(
                          "DZIKIR PETANG",
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0),
                        )
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
