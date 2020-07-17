import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  int currentTab = 1;
  Chat();

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
          return Navigator.of(context).pushNamed('/Chat');
          break;
        case 2:
          return Navigator.of(context).pushNamed('/ProfilePage');
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
                      child: new Icon(Icons.chat, color: Colors.black),
                    )),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: new Container(height: 0.0),
                ),
              ]),
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent[400],
            title: Text("Inbox" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
              ),
              onPressed: () {},
            )
          ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Start Chatting',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text('See and send all your messages right here', style: TextStyle(fontSize: 17)),
              ],
            ),
          )
          );
  }
}
