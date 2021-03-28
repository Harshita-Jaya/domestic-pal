import 'package:domestic_pal/screens/home_employee/home_employee.dart';
import 'package:flutter/material.dart';
import 'package:domestic_pal/services/auth_employee.dart';
import 'package:domestic_pal/shared/constants.dart';

class RegisterEmployee extends StatefulWidget {
  final Function toggleView;
  RegisterEmployee({this.toggleView});

  @override
  _RegisterEmployeeState createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        elevation: 0.0,
        title: Text('domesticPal'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Register as an Employee',
                style: TextStyle(color: Colors.cyan[800], fontSize: 20.0),
              ),
              SizedBox(height: 80.0),
              TextFormField(
                decoration: textInputDecorationEmp.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration:
                    textInputDecorationEmp.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.cyan[800],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth
                        .registerWithEmailAndPasswordEmployee(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'could not register with those credentials');
                    } else {
                      setState(() => error = 'Registered successfully');

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HomeEmployee()),
                          (Route<dynamic> route) => false);
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  FlatButton(
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.cyan)),
                    onPressed: () {
                      widget.toggleView();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
