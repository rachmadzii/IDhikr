import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DzikirPetang extends StatefulWidget {
  @override
  _DzikirPetangState createState() => _DzikirPetangState();
}

class _DzikirPetangState extends State<DzikirPetang> {
  Future loadDzikirPetang() async {
    var response = await rootBundle.loadString('data/dzikir_petang.json');
    if (response != null) {
      var res = json.decode(response);
      var data = res['data'];
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('DZIKIR PETANG',
        style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                letterSpacing: 3.0)),
      ),
      body: FutureBuilder(
        future: loadDzikirPetang(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext c, int i) {
                    return ExpansionTile(
                      title: Text(
                        snapshot.data[i]['title'],
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                snapshot.data[i]['arabic'],
                                style: TextStyle(fontSize: 24.5, height: 1.15),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(snapshot.data[i]['latin'],
                              style: TextStyle(fontSize: 16.0, height: 1.2, color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(snapshot.data[i]['translation'],
                              style: TextStyle(fontSize: 16.0, height: 1.2)),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
