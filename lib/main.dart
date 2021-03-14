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
  String nimRecord = "";
  List<String> listViewItem = List<String>();

  TextEditingController nimInput = new TextEditingController();
  TextEditingController nameInput = new TextEditingController();
  TextEditingController addressInput = new TextEditingController();

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
                    controller: nimInput,
                    decoration: InputDecoration(
                        labelText: 'NIM', hintText: 'masukan nim'),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                  ),
                  TextFormField(
                    controller: nameInput,
                    decoration: InputDecoration(
                        labelText: 'Nama Lengkap ',
                        hintText: 'masukan nama lengkap'),
                  ),
                  TextFormField(
                    controller: addressInput,
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
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: new ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RaisedButton(
                              child: new Text('Create'),
                              color: Colors.blueAccent,
                              onPressed: () {
                                setState(() {});
                                listViewItem.add(
                                    "NIM:${nimInput.text}\nNama:${nameInput.text}\nAlamat:${addressInput.text}\nJenis Kelamin:${jk}\nJurusan:${dropdownValue}");
                                print(nimInput.text);
                                nimInput.clear();
                                nameInput.clear();
                                addressInput.clear();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Data Riwayat Mahasiswa",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listViewItem.map((String value) {
                        return Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 15),
                            ));
                      }).toList()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
