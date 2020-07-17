import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/FavoriteGridItemWidget.dart';
import 'package:wixApp/helper/SearchBarWidget.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/pages/porductListing.dart';
import 'package:wixApp/service/Service.dart';
import '../perferencees.dart';
class Home extends StatefulWidget{
  int currentTab = 2;
@override
  _Home createState() => _Home();
}

class _Home extends State<Home>{

List<Product> couponList = new List<Product>();
List<Product> productList = new List<Product>();
Services _services = Services();
String _noDataText='';
void getCouponList() async{
  Services _services = Services();
  await _services.getCouponList().then((value) {
    if(mounted){
    setState(() {
      couponList=value;
      print("=++++++++++++Coupon List+++++++++++======");
      print(couponList.length);
    });}
  });
}

@override
void initState() { 
  super.initState();
  getCouponList();
  // print("=============Validity==========");
  // _services.CheckValidity();
}

void _selectTab(int tabItem) {
  setState((){
    this.widget.currentTab = tabItem;
    switch (tabItem) {
      case 0:
        return Navigator.of(context).pushReplacementNamed('/Home');
        break;
      case 1:
        return Navigator.of(context).pushReplacementNamed('/ProfilePage');
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
              child: new Icon(Icons.home, color: Colors.black),
            )),

        BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Colors.black,),
          title: new Container(height: 0.0),
        ),
      ]),
      body: Scaffold(
      appBar: AppBar(
          title: Text('Product Listing',style: kAppbarStyle,),
           automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: SearchBarWidget(
                onClickFilter: (event) {},
              ),
            ),
           GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 4,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(couponList.length, (index) {
                return FavoriteGridItemWidget(
                 food: couponList[index],
                );
              }),
            ),
          ],
        ),
      )
        ),
      );
  }
}