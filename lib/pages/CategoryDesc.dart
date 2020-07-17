import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wixApp/Costants/Constants.dart';

class CategoryDesc extends StatefulWidget {
  final String desc;
  final String title;
  final String price;
  CategoryDesc({Key key, @required this.desc,@required this.title,this.price}) : super(key: key);
  @override
  _CategoryDescState createState() => _CategoryDescState();
}

class _CategoryDescState extends State<CategoryDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.cover,
                image:CachedNetworkImageProvider('https://images.unsplash.com/photo-1490818387583-1baba5e638af?ixlib=rb-1.2.1&w=1000&q=80'),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Details",style:kDetailsHeadStyle,),
                          ],
                        ),
                        Text(this.widget.desc,style:kDetailsStyle,),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Price: ",style: kDetailsHeadStyle,),
                        Text("₹"+this.widget.price+"/Kg",style:kPriceStyle,),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  height: 50,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).accentColor.withOpacity(0.3)
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.shopping_basket),
                          Text("Add To Basket",style: kAddToCartStyle,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}