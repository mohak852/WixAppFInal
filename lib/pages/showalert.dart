import 'package:flutter/material.dart';

class ShowAlert extends StatefulWidget {
@override
  _ShowAlert createState() => _ShowAlert();
}

class _ShowAlert extends State<ShowAlert>{
@override
  Widget build(BuildContext context) {
  
    return Scaffold(  
      body:  Column( 
        children: <Widget>[
          showAlertDialog(context,'hello'),
        ],
      ),
    );
  }
} 
showAlertDialog(BuildContext context,String title) {
  AlertDialog alert;
  // set up the button
  Widget okButton  =  FlatButton(
    child: Text("OK"),
    onPressed: () {

     },
  );

  // set up the AlertDialog
   alert = AlertDialog(
    title: Text(title),
    content: Text('desc'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}