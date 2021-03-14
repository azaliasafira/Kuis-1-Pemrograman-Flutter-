import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  // This widget is the root of your application.
  String jk = "";
  String dropdownValue = 'Teknologi Informasi';

  void pilihJk(String value) {
    setState(() {
      jk = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Data Mahasiswa"),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'NIM', hintText: 'masukan nim'),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nama Lengkap ',
                        hintText: 'masukan nama lengkap'),
                  ),
                  TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        labelText: 'Alamat', hintText: 'masukan alamat'),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 20.0),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text('Pilih Jenis Kelamin'),
                      ),
                      RadioListTile(
                        value: "Laki - Laki",
                        title: new Text("Laki-Laki"),
                        groupValue: jk,
                        onChanged: (String value) {
                          pilihJk(value);
                        },
                      ),
                      RadioListTile(
                        value: "Perempuan",
                        title: new Text("Perempuan"),
                        groupValue: jk,
                        onChanged: (String value) {
                          pilihJk(value);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text('Pilih Jurusan'),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.blueAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Teknologi Informasi',
                          'Elektronika',
                          'Akuntansi'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: new ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RaisedButton(
                              child: new Text('Create'),
                              color: Colors.blueAccent,
                              onPressed: () {/** */},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
