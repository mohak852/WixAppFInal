import 'package:flutter/material.dart';



class GetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom:30),
        child:
        RaisedButton(
            padding: const EdgeInsets.all(10),
            color: Colors.orangeAccent,
            child:Row(
              children: <Widget>[
                Icon(Icons.add),
                Text(
                  "Create Your Own",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple[800],
                  ),
                ),
              ],
            ),
            onPressed: (){

            },
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        )
    );
  }
}
