
import 'package:flutter/material.dart';
import 'package:wixApp/model/cartItem.dart';

class CartItemWidget extends StatefulWidget {
  CartItem cartItem ;
  CartItemWidget({Key key,this.cartItem}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        Navigator.of(context).pushNamed('/food', arguments:'hello');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(image: NetworkImage(this.widget.cartItem.imagePath), fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.widget.cartItem.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        Text(
                          "₹${this.widget.cartItem.price}",
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       widget.quantity = this.incrementQuantity(widget.quantity);
                      //     });
                      //   },
                      //   iconSize: 30,
                      //   padding: EdgeInsets.symmetric(horizontal: 5),
                      //   icon: Icon(Icons.add_circle_outline),
                      //   color: Theme.of(context).hintColor,
                      // ),
                      Text("x${this.widget.cartItem.quantity}", style: Theme.of(context).textTheme.subhead),
                      // IconButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       widget.quantity = this.decrementQuantity(widget.quantity);
                      //     });
                      //   },
                      //   iconSize: 30,
                      //   padding: EdgeInsets.symmetric(horizontal: 5),
                      //   icon: Icon(Icons.remove_circle_outline),
                      //   color: Theme.of(context).hintColor,
                      // ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  incrementQuantity(int quantity) {
    if (quantity <= 99) {
      return ++quantity;
    } else {
      return quantity;
    }
  }

  decrementQuantity(int quantity) {
    if (quantity > 1) {
      return --quantity;
    } else {
      return quantity;
    }
  }
}