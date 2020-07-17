import 'package:flutter/material.dart';
class Shipping extends StatefulWidget {
@override
  _Shipping createState() => _Shipping();
}
class _Shipping extends State<Shipping>{
  bool isSwitch=true;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
      title: const Text('Shipping Details',textAlign:TextAlign.center,),
    ),   
    body:SingleChildScrollView(child: Column(
      children: <Widget>[
          getTextField("Address *"),
          getTextField("City *"),
          getTextField("Zip/Postal Code *"),
          getTextField("Phone *"),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 15, 15),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children : <Widget>[
             Text(
              "Use as Billing Address",
              style:TextStyle( 
                fontSize: 15
              )
            ),
            Switch(
              value: isSwitch, 
              onChanged: (value){
                      if(isSwitch==true){
                        setState(() {
                      isSwitch=false;
                          });
                      }else{
                      setState(() {
                      isSwitch=true;
                     });
                  }
              },
              activeColor: Colors.white,
              activeTrackColor: Colors.orangeAccent,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(bottom:30),
            child:
            RaisedButton(
              padding: const EdgeInsets.all(10),
            color: Colors.orangeAccent,
          child: Text("Continue",style: TextStyle(
            color: Colors.white
          )),
          onPressed: (){

          },
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        )
          )
      ],
    )
    )
   );
   }
   void toggleSwitch(){
      if(isSwitch==true){
        setState(() {
          isSwitch=false;
        });
      }else{
        setState(() {
          isSwitch=true;
        });
      }
   }
  Widget getTextField(String labelText)
  {
    return Container(
      margin: const EdgeInsets.fromLTRB(17, 5, 17, 15),
      child: TextField(decoration: InputDecoration(
                          labelText: labelText,
                           )
                      ),
    );
  }
}