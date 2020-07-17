import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/model/user.dart';

import '../perferencees.dart';



class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  User user = new User();
  @override
  initState() {
    super.initState();
    initPrefs();
  }
  void initPrefs()async{
    Preferences _prefs = Preferences();
    await _prefs.getUser().then((value){
      setState(() {
        user=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text("DashBoard",style: kAppbarStyle,),
//          subtitle: Text("${this.user.name}",style: kMyProfileStyle,),
        )
      ),
      body: Container(
        child: Text("${this.user.name}"),
      ),
    );
  }
}
