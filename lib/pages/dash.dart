import 'package:carousel_slider/carousel_slider.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/CardView.dart';
import 'package:wixApp/helper/CouponCard.dart';
import 'package:wixApp/helper/createyourOwn.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/model/slide.dart';
import 'package:wixApp/model/user.dart';
import 'package:wixApp/pages/home.dart';
import 'package:wixApp/perferencees.dart';
import 'package:wixApp/service/Service.dart';
import 'package:wixApp/widgets/slide_item.dart';
import 'notification.dart';

class Dash extends StatefulWidget {
@override
  _Dash createState() => _Dash();
}

class _Dash extends State<Dash>{
  static final double containerHeight = 150.0;
  double clipHeight = containerHeight * 0.35;
  DiagonalPosition position = DiagonalPosition.BOTTOM_LEFT;
  final PageController _pageController=PageController(
    initialPage:0
  );
  User user = new User();
  List<Product> couponList = new List<Product>();
  void getCouponList() async{
    Services _services = Services();
    await _services.getCouponList().then((value) {
      setState(() {
        couponList=value;
        print("=+++++++++++++++++++++++++++======");
        print(couponList.length);
      });
    });
  }

  @override
  initState() {
    super.initState();
    initPrefs();
    print(user.name);
    print("=================History=============");
    getCouponList();
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
        centerTitle: true,
        leading: Container(),
        backgroundColor: Colors.deepPurple[500],
      title:  Text('Catnyx',style: kAppbarStyle),

    ),   
    body:SingleChildScrollView(
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Diagonal(
              clipShadows: [ClipShadow(color: Colors.black)],
              position: position,
              clipHeight: clipHeight,
              child: Container(
                color: Colors.deepPurple,
                height: containerHeight,
                child: Container(
          width: double.infinity,
          color: Colors.deepPurple[800],
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
                Container(
                color: Colors.deepPurple[800],
                margin:const EdgeInsets.all(25),
                child: Text("Hey, "+"${user.name[0].toUpperCase()}"+"${user.name.substring(1)}", style: kNameStyle
                )
              ),
            ]
          )
      ),
              ),
            ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
            child: CardView()),
            Container(
                margin:const EdgeInsets.fromLTRB(25, 40, 15, 0),
                 child: Text("Get Inspired By Our Top Users", style: kInsipredFromUsStyle
             )
            ),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayCurve: Curves.easeInOut
          ),
          items: this.couponList.map((item) => Container(
            height: 300,
            child: CouponCard(product: item,),
          )).toList(),
        ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: CreateOwn()
            )
           ],
         )
       )
     );
   }
}
