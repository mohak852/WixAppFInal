
import 'package:flutter/material.dart';
import 'package:wixApp/helper/CartItemWidget.dart';
import 'package:wixApp/model/cartItem.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/service/Service.dart';
class Cart extends StatefulWidget {
  int currentTab = 3;
  Cart({Key key, this.currentTab}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final globalKey = GlobalKey<ScaffoldState>();
  List<CartItem> cartItems = new List<CartItem>();
  final _cartHelper = CartHelper.instance;
  bool _emptyCart = false;
  double _checkoutPrice;
  bool couponApplied = false;
  List<Product> couponsList = List<Product>();
  Product selectedCoupon;
  @override
  initState() {
    super.initState();
    // _selectTab(this.widget.currentTab);
    getCartItems();
    getTotalPrice();
    getCoupons();
  }
  Services _services = Services();
  void getCoupons() async {
    await _services.getCouponList().then((value) {
      couponsList = value;
    });
  }

  void getTotalPrice() async {
    await _cartHelper.getTotalPrice().then((value) {
      setState(() {
        _checkoutPrice = value;
      });
    });
  }

  void getCartItems() async {
    try {
      await _cartHelper.getCart().then((value) {
        if (value.length == 0) {
          setState(() {
            this._emptyCart = true;
          });
        } else {
          setState(() {
            cartItems = value;
          });
        }
      });
    } catch (_) {
      print(_);
    }
  }

  
  Future<bool> _onBackPress() {
    Navigator.of(context).pushNamed('/Dash');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController couponController = new TextEditingController();
    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
        key: globalKey,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/Dash');
              },
              child: Icon(Icons.arrow_back)),
          actions: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.remove_shopping_cart,
                      color: Colors.red[300],
                    ),
                    onPressed: () {
                      setState(() {
                        this._emptyCart = true;
                        _cartHelper.emptyCart();
                      });
                    }),
              ],
            )
          ],
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Cart",
            style: Theme.of(context)
                .textTheme
                .headline6
                .merge(TextStyle(letterSpacing: 1.3,color: Colors.white)),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 150),
              padding: EdgeInsets.only(bottom: 15),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        leading: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(context).accentColor,
                        ),
                        title: Text(
                          'Shopping Cart',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kShoppingCartStyle,
                        ),
                        subtitle: Text(
                          'Verify your quantity and click checkout',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                    this._emptyCart
                        ? Image.asset("assets/emptycart.png")
                        : ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: cartItems.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 15);
                            },
                            itemBuilder: (context, index) {
                              return CartItemWidget(
                                cartItem: cartItems[index],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
            this._emptyCart
                ? SizedBox()
                : Positioned(
                    bottom: 0,
                    child: Container(
                      height: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.15),
                                offset: Offset(0, -2),
                                blurRadius: 5.0)
                          ]),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Stack(
                              fit: StackFit.loose,
                              alignment: AlignmentDirectional.centerEnd,
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          '/confirmcheckout',
                                          arguments:
                                              this._checkoutPrice.toInt());
                                    },
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    color:Colors.black,
                                    shape: StadiumBorder(),
                                    child: Text(
                                      'Place Order',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                      color: Colors.white)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    this._checkoutPrice != null
                                        ? '₹${this._checkoutPrice}'
                                        : '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .merge(TextStyle(
                                            color: Colors.deepPurple)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
