import 'package:domestic_pal/models/user.dart';
import 'package:domestic_pal/screens/authenticate/authenticate_customer.dart';
import 'package:domestic_pal/screens/authenticate/authenticate_employee.dart';
import 'package:flutter/material.dart';

class Hire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Do you want to:',
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(height: 20.0),
          //FOR CUSTOMERS
          FlatButton(
            onPressed: () {
              AuthenticateCustomer();
            },
            minWidth: 115.0,
            color: Colors.red[800],
            child: Text(
              'Hire',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          //FOR EMPLOYEES
          FlatButton(
            onPressed: () {
              AuthenticateEmployee();
            },
            minWidth: 60.0,
            color: Colors.amber[800],
            child: Text(
              'Get hired',
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    ));
  }
}