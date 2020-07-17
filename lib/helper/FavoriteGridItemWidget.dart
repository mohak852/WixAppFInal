import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/pages/productdetails.dart';
import 'package:wixApp/service/Service.dart';


class FavoriteGridItemWidget extends StatefulWidget {
 Product food;
 FavoriteGridItemWidget({Key key,this.food}) : super(key: key);
  @override
  _FavoriteGridItemWidgetState createState() => _FavoriteGridItemWidgetState();
}

class _FavoriteGridItemWidgetState extends State<FavoriteGridItemWidget> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;
  String layout = 'grid';
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    animation = Tween(begin: -0.5,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context,Widget child){
          return InkWell(
            onTap: (){
      print("+++++++++++++++++++++++++++++++++++++${this.widget.food.id}");
              Services().getProductbyId(this.widget.food.id).then((response){
//              Navigator.of(context).push('/menulist',arguments:response);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(
                foodList: response,

              )));
              });
            },
            highlightColor: Colors.black,
            splashColor: Theme.of(context).accentColor.withOpacity(0.08),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage('https://www.helpguide.org/wp-content/uploads/table-with-grains-vegetables-fruit-768.jpg')),
                                boxShadow: [
                                  BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.4), blurRadius: 15, offset: Offset(0, 5)),
                                ],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            this.widget.food.product_name,
                            style: Theme.of(context).textTheme.body2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2),
                          Text(
                           this.widget.food.product_description,
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25, top: 5),
                      height: 25,
                      width: 70,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)), color: Colors.white),
                      // alignment: AlignmentDirectional.topCenter,
                      child: Center(
                        child: Text(
                          "₹${this.widget.food.product_price.toString()}.00",
                          style: Theme.of(context).textTheme.body2.merge(TextStyle(color: Theme.of(context).primaryColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}

