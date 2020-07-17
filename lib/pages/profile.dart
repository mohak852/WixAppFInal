
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/AlertDialog.dart';
import 'package:wixApp/model/user.dart';
import 'package:wixApp/perferencees.dart';

class ProfilePage extends StatefulWidget {
  int currentTab = 2;
  ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


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
      print(user);
    });
  }


  void _selectTab(int tabItem) {
    setState((){
      this.widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          return Navigator.of(context).pushNamed('/Home');
          break;
        case 1:
          return Navigator.of(context).pushNamed('/ProfilePage');
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile",style: kMyProfileStyle,),
          backgroundColor: Colors.deepPurpleAccent[400],
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                context: context,
                builder: (_) => LogoutOverlay(),
              );
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).accentColor,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 22,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedIconTheme: IconThemeData(size: 28),
            unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
            currentIndex: 1,
            onTap: (int i) {
              this._selectTab(i);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: new Container(height: 0.0),
              ),

              BottomNavigationBarItem(
                  title: new Container(height: 5.0),
                  icon: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).accentColor.withOpacity(0.4),
                            blurRadius: 40,
                            offset: Offset(0, 15)),
                        BoxShadow(
                            color: Theme.of(context).accentColor.withOpacity(0.4),
                            blurRadius: 13,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: new Icon(Icons.person, color: Colors.black),
                  )
              ),
            ]),
        body: ListView(
          children: [
            Center(
                child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  Container(
                      width: 125.0,
                      height: 125.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage('assets/pc.jpg')
                          ))),
                  Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                  Text(
                    '${user.name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                  Text(
                    '${user.email}',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  //Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0)),
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    highlightColor: Colors.grey[200],
                    onPressed: () {
                      Navigator.of(context).pushNamed('/EditProfile');
                    },
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.deepPurpleAccent[400]),
                    ),
                  ),
                ]),
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(17, 20, 5, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'My Activities',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    'See all your activity as a member',
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'No activity yet',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.black,
                thickness: 3,
              ),
            ),

          ],
        ));
  }
}


