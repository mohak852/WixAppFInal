import 'package:flutter/material.dart';

class NotificationLayout extends StatefulWidget {
  NotificationLayout();
  final List<String> notifications = <String>['A', 'B', 'C'];

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationLayout> {
  @override
  Widget build(BuildContext context) {
    if (widget.notifications.length == 0) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent[400],
            title: Text("My Cart"),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Cart Is Empty',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text('Go back to store', style: TextStyle(fontSize: 15)),
              ],
            ),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent[400],
            title: Text("Notifications"),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: widget.notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(  
                          mainAxisAlignment: MainAxisAlignment.center,                      
                          children :<Widget>[ 
                            Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 50),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right:10),
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://assets.ifttt.com/images/channels/651849913/icons/large.png")))),
                              Expanded(
                                  child: Text(
                                    'Spread the word about your new mobile place. Invite people now!'
                                  )),
                             Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                             child: 
                              Text(
                                '9d',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              )),
                                                        ],
                          ),
                            Divider(
                                thickness:2
                              )
                          ],
                        );
                      })),
                 
            ],
          ));
    }
  }
}

Widget itemImage(item) {
  return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(
                  "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"))));
}

Widget notificationDetails(item) {
  return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              'Spread the word about your new mobile place. Invite people now!',
              style: TextStyle(fontSize: 15,)
            ),
          ]),
        ],
      ));
}


Divider divider(thickness) {
  return new Divider(
    color: Colors.grey[300],
    thickness: double.parse(thickness),
  );
}