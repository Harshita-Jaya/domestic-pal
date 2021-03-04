import 'package:domestic_pal/services/auth_customer.dart';
import 'package:flutter/material.dart';

class SignInCustomer extends StatefulWidget {
  @override
  _SignInCustomerState createState() => _SignInCustomerState();
}

class _SignInCustomerState extends State<SignInCustomer> {
  final AuthService _authCustomer = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        elevation: 0.0,
        title: Text('LOGIN SCREEN'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            print('Signed in');
            dynamic result = await _authCustomer.signInAnon();
            if (result == null) {
              print('error ');
            } else {
              print(result.uid);
              print(result.category);
            }
          },
        ),
      ),
    );
  }
}
