import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/vaccination.dart';
import 'package:flutter_app/widgets/calender.dart';

import 'screens/polio_main_screen.dart';

class TabControler extends StatefulWidget {
  @override
  _TabControllerState createState() => _TabControllerState();
}

class _TabControllerState extends State<TabControler> {
  final _auth = FirebaseAuth.instance;

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    PolioMain(),
    MyApp1(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                child: null,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('image/yash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                title: Text('Vaccine Tracker'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ((VaccinationTracker()))),
                ),
              ),
              ListTile(
                title: Text('Development Tracker'),
                onTap: null,
              ),
              ListTile(
                title: Text('Health Tips'),
                onTap: null,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Polio Notifier'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Logout"),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                _auth.signOut();
              }
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calender'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
