
import 'package:flutter/material.dart';
import 'package:wixApp/model/cartItem.dart';

class ShoppingCartFloatButtonWidget extends StatefulWidget {
  const ShoppingCartFloatButtonWidget({
    this.iconColor,
    this.labelColor,
    this.labelCount ,
    Key key,
  }) : super(key: key);

  final Color iconColor;
  final Color labelColor;
  final int labelCount;

  @override
  _ShoppingCartFloatButtonWidgetState createState() => _ShoppingCartFloatButtonWidgetState();
}

class _ShoppingCartFloatButtonWidgetState extends State<ShoppingCartFloatButtonWidget> {
  final  _carthelper =CartHelper.instance ;
  int totalCartItems= 0;
  int cartCount;
  @override
  void initState() {

    super.initState();
    getItemsCount();

  }
  void getItemsCount( ) async{
    await _carthelper.totalCartItems().then((value){
      setState(() {
        totalCartItems=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        color: Theme.of(context).accentColor,
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.of(context).pushNamed('/cart');
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: this.widget.iconColor,
              size: 28,
            ),
            // Container(
            //   child: Text(
            //     this.widget.labelCount.toString(),
            //     textAlign: TextAlign.center,
            //     style: Theme.of(context).textTheme.caption.merge(
            //           TextStyle(color: Theme.of(context).primaryColor, fontSize: 9),
            //         ),
            //   ),
            //   padding: EdgeInsets.all(0),
            //   decoration: BoxDecoration(color: this.widget.labelColor, borderRadius: BorderRadius.all(Radius.circular(10))),
            //   constraints: BoxConstraints(minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
            // ),
          ],
        ),
      ),
    );

  }
}
