
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wixApp/model/slide.dart';
import 'package:wixApp/widgets/slide_dots.dart';
class SlideItem extends StatelessWidget{
final int index;
SlideItem(this.index);
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child:
        Stack(
          children: <Widget>[
            Image.asset(slideList[index].imageUrl,
            fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Container(margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Text(
                  slideList[index].title,style :TextStyle(
                    color:Colors.white
                  )
                )),
             Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Container(margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Text(
                  slideList[index].desc,style :TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold
                  )
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children : <Widget>[
                  
                 Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 0, 30),
            child:
            RaisedButton(
              elevation: 5,
            color: Colors.white,
          child: Text("Read More",style: TextStyle(
            color: Colors.deepPurple[800]
          )),
          onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        )
          ),
          getDot(index)
              ]
                          )
                      ],
                  ),
              ]
            )
        ])
    );
  }

 Widget getDot(int index){
   return  Container(
               margin: const EdgeInsets.fromLTRB(0, 0, 30, 30),
                child: Row(
                  children : <Widget>[
                    for(int i =0;i<slideList.length;i++)
                     if(i==index)
                     SlideDots(true)
                     else
                     SlideDots(false)   
                  ]
                ),
            );
 } 

}