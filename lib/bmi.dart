import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';
import 'about.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String nama = '';
  String dropdownValue;
  String tanggal;
  String bulan;
  String tahun;

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: Colors.blue[900],
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            leading: Icon(
              Icons.assignment,
              color: Colors.white,
            ),
          title: Text('MENGHITUNG BMI'),
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ],
          ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child:
                    Image.asset('images/bmi.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      // color: Colors.blue[900],
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            nama = txt;
                          });
                        },
                        decoration:
                            InputDecoration(filled: true, hintText: 'Nama'),
                      ),
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Colors.blue[900],
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        hint: new Text(" Jenis-Kelamin"),
                        underline: Container(
                          height: 1,
                        ),
                        items: <String>['Laki-laki', 'Perempuan']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )),
            Container(
              child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        tanggal = txt;
                      });
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration:
                        InputDecoration(filled: true, hintText: 'Tanggal'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        bulan = txt;
                      });
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration:
                        InputDecoration(filled: true, hintText: 'Bulan'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        tahun = txt;
                      });
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration:
                        InputDecoration(filled: true, hintText: 'Tahun'),
                  ),
                ),
              ],
            )),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            tinggi = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('cm'),
                            filled: true,
                            hintText: 'Tinggi'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            berat = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            filled: true,
                            hintText: 'Berat'),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                            tinggi_badan: tinggi,
                            berat_badan: berat,
                            nama: nama,
                            kelamin: dropdownValue,
                            tanggal: tanggal,
                            bulan: bulan,
                            tahun: tahun)),
                  );
                },
                       padding: EdgeInsets.only(top: 10, bottom: 10),
                       color: Colors.white,
                          textColor: Colors.blue[900],
                       child: Text(
                         'HITUNG BMI',
                         style:
                         TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                       ),
                     ),
                   ),
                ],
              ),
            ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              color: Colors.blue[900],
              alignment: Alignment.center,
              child: Text(
                'Developed by Agus Aditya',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        );
  }
}