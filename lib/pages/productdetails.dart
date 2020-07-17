
import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/ShoppingCartFloatButtonWidget.dart';
import 'package:wixApp/model/cartItem.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/pages/cart.dart';
class ProductDetail extends StatefulWidget{
  final Product foodList;
  ProductDetail({Key key, this.foodList}) : super(key: key);
  @override
_ProductDetail createState() => new _ProductDetail();
}

class _ProductDetail extends State<ProductDetail> {
 @override
  void initState() {
    super.initState();
    print(this.widget.foodList.product_name);
  }
  int cartCount = 0;
  int quantity = 0;
  double totalPrice = 0.00;
  List<CartItem> cartItems = new List<CartItem>();
  final _cartHelper = CartHelper.instance;

  void cartPriceAdd(int price) {
    setState(() {
      totalPrice += price;
      quantity += 1;
    });
  }


  Future<bool> _onBackPressed() {
    Navigator.of(context).pushNamed('/Dash');
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: _onBackPressed,
          child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 120),
              padding: EdgeInsets.only(bottom: 15),
              child: CustomScrollView(
                primary: true,
                shrinkWrap: false,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor:
                    Colors.white,
                    expandedHeight: 300,
                    elevation: 0,
                    iconTheme:
                    IconThemeData(color: Colors.white),
                    flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          child: Image.asset(
                            "assets/fezbot2000-nahUo1GhcrA-unsplash.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Wrap(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  this.widget.foodList.product_name,
                                  maxLines: 5,
                                  style: kProductStyle,
                                ),
                              ),
                            ],
                          ),
                          Text(this.widget.foodList.product_description),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 32,
              right: 20,
              child: ShoppingCartFloatButtonWidget(
                iconColor:Colors.black54,
                labelColor: Colors.white,
                labelCount: this.cartCount,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 140,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    color:Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color:Colors.white,
                          offset: Offset(0, -2),
                          blurRadius: 5.0)
                    ]),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Quantity',
                              style:kQuantityStyle
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (this.quantity > 0) {
                                      this.quantity -= 1;
                                      this.totalPrice -=
                                          this.widget.foodList.product_price;
                                    }
                                  });
                                },
                                iconSize: 30,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                icon: Icon(Icons.remove_circle_outline),
                                color: Colors.white,
                              ),
                              Text(quantity.toString(),
                                  style:kQuantity1Style),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    this.quantity += 1;
                                    this.totalPrice += this.widget.foodList.product_price;
                                  });
                                },
                                iconSize: 30,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                icon: Icon(Icons.add_circle_outline),
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10),
                          Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.centerEnd,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 110,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      this.cartCount += this.quantity;
                                      CartItem selectedItem = CartItem(
                                          imagePath: "https://i.pinimg.com/originals/b0/8e/47/b08e47cbeacbf814be0ab231938e28af.jpg",
                                          name: this.widget.foodList.product_name,
                                          price: this.totalPrice
                                      );
                                      if (this.totalPrice > 0) {
                                        _cartHelper.addToCart(selectedItem);
                                      }
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  color: Colors.white,
                                  shape: StadiumBorder(),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      'Add to Cart',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Theme
                                              .of(context)
                                              .primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  totalPrice.toString(),
                                  style: kTotalPriceStyle,
                                ),
                              )
                            ],
                          ),
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