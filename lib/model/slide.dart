import 'package:flutter/material.dart';
class Slide{
final String imageUrl;
final String title;
final String desc;
Slide({@required this.imageUrl, @required this.title, @required this.desc});}

final slideList=[
Slide(
   imageUrl: 'assets/CDM Logo - 4 Final Final-01.png',
   title: 'Tom: Business / Store Owner', 
   desc: 'See how Tom uses the app to grow & manage his online store'),
   Slide(
   imageUrl: 'assets/CDM Logo - 4 Final Final-01.png',
   title: 'Sam: Business / Store Owner', 
   desc: 'See how Tom uses the app to grow & manage his online store'),
   Slide(
   imageUrl: 'assets/CDM Logo - 4 Final Final-01.png',
   title: 'Allen: Business / Store Owner', 
   desc: 'See how Tom uses the app to grow & manage his online store'),
];