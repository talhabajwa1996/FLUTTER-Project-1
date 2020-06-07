import 'package:flutter/material.dart';

class EmailAndPasswordFields{
  Widget email() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        prefixIcon: Icon(Icons.email),
        hintText: 'Email',
        //errorText: 'Invalid Email'
      ),
    );
  }

  Widget password() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        prefixIcon: Icon(Icons.lock),
        hintText: 'Password',
        //errorText: 'Password must be atleast 6 characters',
      ),
    );
  }
}