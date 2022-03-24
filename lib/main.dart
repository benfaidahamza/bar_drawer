import 'package:flutter/material.dart';
import 'package:bar_drawer/formulaire.dart';
import 'package:bar_drawer/information.dart';



void main() {
  runApp(new MaterialApp(
    home: new Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Main> {
  @override
  static const String _title = 'First application';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Formulaire()));
      }
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Information()));
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("NaviagtionBar and drawer"),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text("Hello Drawer"),
              new TextButton(
                onPressed: () => Navigator.pop(context), child: new Text("Close"),),
            ],
          ),
        ),
      ),
      body: ListView(
          children:[


            Container(
                alignment: FractionalOffset.center,
                padding: new EdgeInsets.all(32.0),
                child: new Center(
                  child: new Column(
                    children: <Widget>[
                      Image(image: AssetImage('assets/im.jpg')),


                      // new Text('Value=${_value}'),
                      //new IconButton(icon :new Icon(Icons.add) onPressed: add)
                    ],
                  ),
                )),
          ]),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'bar 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'bar 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'bar 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),

    );
  }
}