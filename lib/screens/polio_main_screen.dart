import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/screens/child_detail_screen.dart';

import 'package:flutter_app/widgets/calender.dart';
import 'package:flutter_app/widgets/form/list_model.dart';

class PolioMain extends StatefulWidget {
  @override
  _PolioMainState createState() => _PolioMainState();
}

class _PolioMainState extends State<PolioMain> {
  final _auth = FirebaseAuth.instance;
  DocumentSnapshot documentSnapshot;

  int pincode;
  List locations = [];
  bool refreshButton = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance //INITIALIZING THE LIST
        .collection('camps')
        .doc('440022')
        .snapshots()
        .listen((data) {
      locations = data.data()['schoolname'];
    });
  }

  void aaa() {
    print('baldasf');
    print(locations);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addDetail(), //add button to navigate to next page
        twoBtn(), //by clicking this we are frehing the list
        receivedlistview(), // here we show the output from firebase
        FlatButton(
            onPressed: () {
              aaa();
            },
            child: Text('click me'))
      ],
    );
  }

  Widget receivedlistview() {
    return locations.isNotEmpty
        ? Expanded(
            child: Container(
              // height: 350,
              child: ListView(
                children: [
                  Center(
                      child: Text(
                    'Nearby School',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  ...locations.map((value) {
                    return ListModel(value);
                  })
                ],
              ),
            ),
          )
        : Center(
            child: Text(
              'Please Press refresh Button',
            ),
          );
  }

  Widget twoBtn() {
    return Row(
      children: [
        FlatButton(
          child: Text('Refresh Following list'),
          onPressed: () async {
            FirebaseFirestore.instance //  TAKING OUT PINCODE FOR A USER
                .collection('users')
                .doc(_auth.currentUser.uid)
                .get()
                .then((value) {
              pincode = value.data()['pincode'];
              //print(pincode);

              FirebaseFirestore.instance //INITIALIZING THE LIST
                  .collection('camps')
                  .doc(pincode.toString())
                  .snapshots()
                  .listen((data) {
                locations = data.data()['schoolname'];
              });
              print(locations);
              setState(() {});
            });

            //print('yash zadesss');
            // print(locations.isEmpty);
          },
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ((MyApp1()))),
              );
            },
            child: Icon(Icons.calendar_today, color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }

  Widget addDetail() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            spreadRadius: 50,
            blurRadius: 150,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
        color: const Color(0xff7c94b6),
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('image/yash.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: FlatButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => (ChildDetail())),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              Text(
                'Add Detail of Child',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.navigate_next,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
