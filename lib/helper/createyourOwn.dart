import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/BlockButtonWidget.dart';
import 'package:wixApp/pages/home.dart';



class CreateOwn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child:BlockButtonWidget(color: Colors.deepPurple, text: Text("Buy Our Products",style: kBuyOurProductsStyle,), onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));   
                   })
          )
        ]
    );
  }
}
