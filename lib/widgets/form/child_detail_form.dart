import 'package:flutter/material.dart';

class ChildDetailForm extends StatefulWidget {
  ChildDetailForm(this.submitfn);
  final Function submitfn;

  @override
  _ChildDetailFormState createState() => _ChildDetailFormState();
}

class _ChildDetailFormState extends State<ChildDetailForm> {
  final _formKey = GlobalKey<FormState>();

  String _userName = '', _address = '', _bornLoca = '', _dOB = '';
  int _pincode;

  void trysubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitfn(
        _userName.trim(),
        _address.trim(),
        _bornLoca.trim(),
        _dOB,
        _pincode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Enter name',
                    ),
                    onSaved: (value) {
                      _userName = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('address'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Enter Address',
                    ),
                    onSaved: (value) {
                      _address = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('bornLoc'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Enter Born Location',
                    ),
                    onSaved: (value) {
                      _bornLoca = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('DOB'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      if (value.contains('/')) {
                        var a = value.replaceAll('/', '-');
                        return 'expected format $a';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Enter DOB',
                    ),
                    onSaved: (value) {
                      _dOB = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('pincode'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Pincode of ur area',
                    ),
                    onSaved: (value) {
                      _pincode = int.parse(value);
                    },
                  ),
                  SizedBox(height: 12),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: trysubmit,
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
