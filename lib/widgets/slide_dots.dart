import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget{
final bool isActive;
SlideDots(this.isActive);
@override
  Widget build(BuildContext context){
    return AnimatedContainer(
      duration:Duration(milliseconds:150),
    margin: const EdgeInsets.symmetric(horizontal: 2),
    height: isActive ? 6 : 5,
    width:  isActive ? 6 : 5,
    decoration: BoxDecoration(
      color: isActive ? Theme.of(context).primaryColor : Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    );
  }
}