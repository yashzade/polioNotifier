import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email, password, name;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'SignUp',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 250.0,
              width: 300.0,
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'User Name'),
                            onChanged: (value) {
                              this.name = value;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
                          height: 50.0,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Email'),
                            validator: (value) => value.isEmpty
                                ? 'Email is required'
                                : validateEmail(value.trim()),
                            onChanged: (value) {
                              this.email = value;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
                          height: 50.0,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'),
                            validator: (value) =>
                                value.isEmpty ? 'Password is required' : null,
                            onChanged: (value) {
                              this.password = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {
                              if (checkFields()) {
                                //   AuthService().signIn(email, password);
                              }
                            },
                            child: Container(
                                height: 35.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(27)),
                                child: Center(child: Text('Sign Up'))))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
