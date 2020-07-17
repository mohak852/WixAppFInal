import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/model/user.dart';
import 'package:wixApp/pages/notification.dart';

import '../perferencees.dart';

import 'package:recase/recase.dart';
class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final PageController _pageController=PageController(
      initialPage:0
  );
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
    return  Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            // Container(
            //     margin: const EdgeInsets.all(10),
            //     child:
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         Text('${user.name.camelCase}',style: kDashStyle),
            //       ],
            //     )),
            // Divider(
            //   thickness: 2,
            // ),
            Container(
                margin: const EdgeInsets.all(10),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()=>Navigator.of(context).pushNamed('/DashBoard'),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child:Text("Orders",style:kMemberViewStyle)),
                    ),
                    GestureDetector(
                        onTap: (){

                          Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationLayout()));
                        },
                        child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child:Text("History",style: kMemberViewStyle)))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
