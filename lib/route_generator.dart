import 'package:flutter/material.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/pages/DashBoard.dart';
import 'package:wixApp/pages/MyHomePage.dart';
import 'package:wixApp/pages/SignUpWidget.dart';
import 'package:wixApp/pages/ViewProfile.dart';
import 'package:wixApp/pages/cart.dart';
import 'package:wixApp/pages/chat.dart';
import 'package:wixApp/pages/dash.dart';
import 'package:wixApp/pages/home.dart';
import 'package:wixApp/pages/productdetails.dart';
import 'package:wixApp/pages/signup.dart';


import 'pages/profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case'/SignUp': 
          return MaterialPageRoute(builder: (_) => LoginWidget());
      case'/MyHomePage':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case'/Home':
        return MaterialPageRoute(builder: (_) => Home());
      case'/Dash':
        return MaterialPageRoute(builder: (_) => Dash());
      case'/Chat':
        return MaterialPageRoute(builder: (_) => Chat());
      case'/ProfilePage':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case'/ProductDetail':
        return MaterialPageRoute(builder: (_) => ProductDetail());
      case'/menulist':
      if(args is Product){
        return MaterialPageRoute(builder: (_)=>ProductDetail(foodList: args,));
      }
      break;
      case'/SignUpWidget':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case'/EditProfile':
        return MaterialPageRoute(builder: (_) => EditProfile());
      case'/DashBoard':
        return MaterialPageRoute(builder: (_) => DashBoard());
      case'/cart':
        return MaterialPageRoute(builder: (_) => Cart());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
