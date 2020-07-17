import 'package:flutter/material.dart';
class Password extends StatefulWidget {

@override
  _Password createState() => _Password();
}

class _Password extends State<Password>{
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
              'Forgot Password',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            )
            ),
 Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),),
      Align(
          alignment: Alignment.center,
          child:
        Text(
              'Enter your email address & we'"'"'ll send you a link to',
              style: TextStyle(
                fontSize: 15,
              ),
            )
            ),
Align(
          alignment: Alignment.center,
          child:
        Text(
              'reset your password ',
              style: TextStyle(
                fontSize: 15,
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
            Align(
              alignment: Alignment.center,
              child:
            Container(
              width: 90,
              height: 40,
              child: RaisedButton(
                child: Text('Send',
                style: TextStyle(
                  color: Colors.white
                ),
                ),
                color: Colors.deepPurple[800],
                shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: null) ,

            )
            )
          ],
        ),
    );
  }
}