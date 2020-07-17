import 'package:flutter/material.dart';
import 'package:wixApp/pages/productdetails.dart';
class ProductListing extends StatefulWidget{

  @override
_ProductListing createState() => new _ProductListing();
}

class _ProductListing extends State<ProductListing>{
@override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
      title: const Text('Product Listing'),
       actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
    )
  ],
    ),
    body: Column(
      children: <Widget>[
             Flexible( child:
    GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
       mainAxisSpacing: 10,
       childAspectRatio:MediaQuery.of(context).size.height/1050,
      crossAxisCount: 2 ,
      children: List.generate(8,(index){
          return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetail()));
          },
                child: getView(),
            );
      }),
      ))
          ]
        )
    );
  }
Widget getView(){
return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  child : Image.asset(
              'assets/images/demo.jpeg',
              height: 200,
              fit: BoxFit.fill,
            )),
            Padding(padding: EdgeInsets.all(5.0)),
                    Text('I'+"'"+'m a Product',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                     Padding(padding: EdgeInsets.all(5.0)),
                    Text('₹ 100.00',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),)
              ],
            
        );
}
}