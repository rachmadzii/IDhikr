import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AsmaulHusna extends StatefulWidget {
  @override
  _AsmaulHusnaState createState() => _AsmaulHusnaState();
}

class _AsmaulHusnaState extends State<AsmaulHusna> {
  Future loadAsmaul() async {
    final response = await rootBundle.loadString('data/asmaul_husna.json');
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
        title: Text('ASMAUL HUSNA',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                letterSpacing: 3.0)),
      ),
      body: FutureBuilder(
        future: loadAsmaul(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext c, int i) {
                    return Card(
                      elevation: 0.0,
                      color: Colors.yellow[700],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snapshot.data[i]['arabic'],
                              style: TextStyle(fontSize: 26.0),
                            ),
                            SizedBox(height: 10.0),
                            Text(snapshot.data[i]['latin'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.0,
                                    letterSpacing: 1.5)),
                            SizedBox(height: 10.0),
                            Text(snapshot.data[i]['translation_id'],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ],
                        ),
                      ),
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
