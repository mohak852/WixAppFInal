
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:wixApp/helper/AlertDialog.dart';
import 'package:wixApp/model/user.dart';

import 'package:wixApp/perferencees.dart';
import 'package:wixApp/service/Service.dart';

class DrawerWidget extends StatefulWidget {
  // final User user ;
  const DrawerWidget({
    // this.user,
    Key key,
  }) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  ProgressDialog pr;

    User user = new User();
   @override
  initState() {
    super.initState();
   
    initPrefs();
  }
  Preferences _preferences = Preferences();
  void initPrefs()async{
    await _preferences.getUser().then((value){
      setState(() {
        user=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
       pr = ProgressDialog(context,
        isDismissible: false,
        customBody: Container(
          color: Colors.transparent,
          child: SpinKitCubeGrid(color: Theme.of(context).accentColor,
        )));
    pr.style(
      backgroundColor: Colors.transparent,
    );
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(0.1),
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
              ),
              accountName: Text(
                this.user.name,
                style: Theme.of(context).textTheme.title,
              ),
              accountEmail: Text(
                this.user.email,
                style: Theme.of(context).textTheme.caption,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: AssetImage('assets/CDM Logo - 4 Final Final-01.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Notifications",
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            title: Text(
              "hjbew"
            ),
            onTap: (){
              showDialog(
        context: context,
        builder: (_) => LogoutOverlay(),
      );
            },
          ),
          ListTile(
            dense: true,
            title: Text(
              "Application Preferences",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Help');
            },
            leading: Icon(
              Icons.help,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Help & Support",
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
         
          ListTile(
            onTap: () {
              Services _services = Services();
              CustomAlertDialog(context);
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).focusColor.withOpacity(1),

            ),
            title: Text(
              "Log out",
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
              "Version 0.0.1",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }


    CustomAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Are you sure want to logout?",
              style:Theme.of(context).textTheme.subhead ,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () async {
                  Services _services = Services();
                  pr.show();
                  _services.LogoutUser().then((response) {
                    pr.hide();
                    Navigator.pushNamed(context,'/LoginPage');
                  });
                },
                child: Text(
                  "Yes",
                  style:Theme.of(context).textTheme.subhead,
                ),
              ),
              MaterialButton(
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No",
                style: Theme.of(context).textTheme.subhead,
                ),
              )
            ],
          );
        });
  }
}
