import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/form/child_detail_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChildDetail extends StatefulWidget {
  final _auth = FirebaseAuth.instance;

  @override
  _ChildDetailState createState() => _ChildDetailState();
}

loadData(name, dob, address, bornLoc, pincode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('name', name);
  await prefs.setString('dob', dob);
  await prefs.setString('address', address);
  await prefs.setString('bornLoc', bornLoc);
  await prefs.setInt('picode', pincode);
}

class _ChildDetailState extends State<ChildDetail> {
  void _submitAuthForm(
    String username,
    String address,
    String bornLoc,
    String dOB,
    int pincode,
  ) async {
    loadData(username, dOB, address, bornLoc, pincode);
    try {
      var data = {
        'username': username,
        'address': address,
        'bornloc': bornLoc,
        'DOB': dOB,
        'pincode': pincode
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget._auth.currentUser.uid)
          .set(data);

      Navigator.pop(context);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Child Details '),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ChildDetailForm(_submitAuthForm),
    );
  }
}
