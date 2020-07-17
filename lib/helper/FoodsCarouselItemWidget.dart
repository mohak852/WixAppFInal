
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wixApp/service/Service.dart';

class FoodsCarouselItemWidget extends StatefulWidget {
  double marginLeft;
  String categoryid ;
  String categoryname ;
  String imagePath ;

  FoodsCarouselItemWidget({Key key,this.marginLeft,this.categoryid,this.categoryname,this.imagePath, }) : super(key: key);

  @override
  _FoodsCarouselItemWidgetState createState() => _FoodsCarouselItemWidgetState();
}

class _FoodsCarouselItemWidgetState extends State<FoodsCarouselItemWidget> {
 bool hasData= false;
 Services _services = Services();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (this.widget.categoryid != null){
     hasData=true; 
    }
    });
    print(this.widget.categoryid);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  _services.getProductbyId(this.widget.categoryid).then((response){
                    // print(response.length);
                       Navigator.of(context).pushNamed('/menulist',arguments:response);
                  } );
                },
                              child: Container(
                  margin: EdgeInsets.only(left: this.widget.marginLeft, right: 20),
                  width: 100,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
          BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.6), blurRadius: 15, offset: Offset(0, 5)),
        ],
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                      
                    //   image:CachedNetworkImageProvider(this.widget.imagePath),
                    //   // image:NetworkImage(this.widget.imagePath),
                    // ),
                  ),
                ),
              ),
             
            ],
          ),
          SizedBox(height: 5),
          Container(
              width: 100,
              margin: EdgeInsets.only(left: this.widget.marginLeft, right: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    hasData?this.widget.categoryname:"abc",
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Text(
                    hasData?this.widget.categoryname:"",
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
