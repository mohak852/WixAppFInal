import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/BlockButtonWidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/CDM Logo - 4 Final Final-01.png',
                height: 120,
                width: MediaQuery.of(context).size.width/2+80,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BlockButtonWidget(color: Colors.black, onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/SignUp');},
                      text: Text("Login Using Email",style: kButtonStyle,),),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}