import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class DzikirPagi extends StatefulWidget {
  @override
  _DzikirPagiState createState() => _DzikirPagiState();
}

class _DzikirPagiState extends State<DzikirPagi> {
  Future loadDzikirPagi() async {
    var response = await rootBundle.loadString('data/dzikir_pagi.json');
    if (response != null) {
      var res = json.decode(response);
      var data = res['data'];
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('DZIKIR PAGI',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                letterSpacing: 3.0)),
      ),
      body: FutureBuilder(
        future: loadDzikirPagi(),
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
                                style: TextStyle(fontSize: 22.0, height: 1.2),
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(snapshot.data[i]['latin'],
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.4,
                                      color: Colors.blue[900])),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(snapshot.data[i]['translation'],
                                  style:
                                      TextStyle(fontSize: 14.0, height: 1.4)),
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
