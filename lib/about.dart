import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi.dart';

void main() => runApp(About());
class About extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InputBMI()));
            },
          ),
          title: Text("About Me"),
          centerTitle: true,
        ),
        body:
        MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        padding: EdgeInsets.only(top:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Column(
              children:[ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: NetworkImage("https://scontent.fdps5-1.fna.fbcdn.net/v/t1.0-9/fr/cp0/e15/q65/89628019_2611889742428927_8664799737439846400_o.jpg?_nc_cat=109&_nc_sid=85a577&efg=eyJpIjoidCJ9&_nc_ohc=GLfn0A3mNGAAX96tkK-&_nc_ht=scontent.fdps5-1.fna&_nc_tp=14&oh=f3aff457108047b5c17caad3dc87e9ab&oe=5E8F920C"),
                  width: 150, height: 150,
                ), ),
                Text("Wayan Agus Aditya Mahendra", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  height: 2.0,
                ), ),
               
               
                Container(
                  margin: EdgeInsets.only(top:20),
                  width: 320,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ContainIcon(0,"Singaraja",Icons.location_searching, Colors.blue[900]),     
                          ContainIcon(12,"Jazz",Icons.music_note, Colors.blue[900]),
                        ],),
                      Column(
                        children: <Widget>[
                          ContainIcon(0,"Suwug",Icons.store, Colors.blue[900]),
                          ContainIcon(12,"Undiksha",Icons.school, Colors.blue[900]),
                        ],
                      ),
                      ], 
                    ), 
                  ),
                ],
            ),
            ],
        )
    );
  }
}

//container  kotak yang berisi icon
class ContainIcon extends StatelessWidget {
  final double atas;
  final String isi;
  final IconData icon;
  final Color warna;
  const ContainIcon(this.atas,this.isi,this.icon,this.warna);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20,top: atas),
        padding: EdgeInsets.only(top: 20),
        width: 130,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
          border: Border.all(width:3,color:Colors.blue[900],),
        ),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: warna,
              size: 40,
            ),

            Container(
              color: Colors.blue[900],
              margin: EdgeInsets.only(top:24),
              width: 125,
              height: 30,
              child:TextBox(isi),
            ),
          ],
        )
    );
  }
}

//untuk text di dalam kotak
class TextBox extends StatelessWidget {
  final String isi;
  const TextBox(this.isi);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text(isi,style: TextStyle(
          height: 1.3,
          fontSize: 18,
          color: Colors.white70,
      ),
      ),
    );
  }
}
