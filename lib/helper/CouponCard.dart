import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/pages/CategoryDesc.dart';
import 'package:wixApp/pages/productdetails.dart';
import 'package:wixApp/service/Service.dart';


class CouponCard extends StatefulWidget {
  final Product product ;
  const CouponCard({Key key,this.product}) : super(key: key);
  @override
  _CouponCardState createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        print("+++++++++++++++++++++++++++++++++++++${this.widget.product.id}");
        Services().getProductbyId(this.widget.product.id).then((response){
//              Navigator.of(context).push('/menulist',arguments:response);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(
            foodList: response,
          )));
        });
      },
          child: Container(
        width: 350,
        margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(1.0), blurRadius: 15, offset: Offset(0, 5)),
            BoxShadow(color: Theme.of(context).accentColor.withOpacity(0.3), blurRadius: 15, offset: Offset(0, 5)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Image of the card
            Container(
              width: 292,
              height: 105,
              decoration: BoxDecoration(
                boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.3), blurRadius: 15, offset: Offset(0, 5)),
          ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomRight: Radius.circular(30)),
              image: DecorationImage(image: CachedNetworkImageProvider('https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg'),
              fit: BoxFit.cover
              )
              ),
            ),
            Container(
              width: 200,
              // margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.widget.product.product_name,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: kCarouselCardStyle,
                  ),
                ],
              )),
          ],
        ),
      ),
    );
  }
}