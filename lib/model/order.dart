import 'package:wixApp/model/product.dart';

class OrderItems{
  String id;
  String order_id;
  String product_id;
  String price;
  Product products;
  OrderItems({this.id,this.order_id,this.product_id,this.price,this.products});
  factory OrderItems.fromJSON(Map<String,dynamic> jsonMap){
    return OrderItems(
      id: jsonMap["id"].toString(),
      order_id: jsonMap['order_id'].toString(),
      product_id: jsonMap['product_id'].toString(),
      price: jsonMap['price'].toString(),
      products: jsonMap['product'],
    );
  }
}