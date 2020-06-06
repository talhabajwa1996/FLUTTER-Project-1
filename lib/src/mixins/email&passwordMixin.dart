import 'package:flutter/material.dart';

class EmailAndPasswordFields{
  Widget email() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        //errorText: 'Invalid Email'
      ),
    );
  }

  Widget password() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        //errorText: 'Password must be atleast 6 characters',
      ),
    );
  }

  Widget submitButton(String child) {
    return RaisedButton(
      child: Text(child),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}