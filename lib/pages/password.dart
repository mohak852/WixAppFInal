import 'package:flutter/material.dart';

import 'dash.dart';
import 'forgotPassword.dart';
class MyPassword extends StatefulWidget {

@override
  _Password createState() => _Password();
}

class _Password extends State<MyPassword>{
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
    IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        // do something
        Navigator.pop(context);
      },
    ),
        
Align(
          alignment: Alignment.center,
          child:
        Text(
              'Verify your Wix',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            )
            ),
Align(
          alignment: Alignment.center,
          child:
        Text(
              'Password',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            )
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
            child:
            TextField(
              autofocus: true,
              decoration:InputDecoration(
                labelText: "Your email",
               labelStyle: TextStyle(
                  color: Colors.deepPurple[800],
                  fontSize: 18
                )
              )
            )
            ),
             Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
            Align(
              alignment: Alignment.center,
              child:
            Container(
              width: 90,
              height: 40,
              child: RaisedButton(
                child: Text('Log In',
                style: TextStyle(
                  color: Colors.white
                  ),
                ),
                color: Colors.deepPurple[800],
                shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed:(){
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => Dash()));         
                }
              ) ,

            )
            ),
             Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
            Align(
          alignment: Alignment.center,
          child:
        new GestureDetector(
           onTap: () {
        Navigator.push(context,  MaterialPageRoute(builder: (context) => Password()));
        },
        child:        
          Text('Forgot Password?',
              style: TextStyle(
                fontSize: 15,
                color: Colors.deepPurple
              ),
            ),
        ),
            ),
          ],
        ),
    );
  }
}