import 'package:wixApp/model/order.dart';

class OrderList{
  String id;
  String qty;
  String total;
  List<OrderItems> orderItem;
  OrderList({this.id,this.qty,this.total,this.orderItem});
  factory OrderList.fromJSON(Map<String,dynamic> jsonMap){
    return OrderList(
      id: jsonMap["id"].toString(),
      qty: jsonMap["qty"].toString(),
      total: jsonMap["total"].toString(),
      orderItem: (jsonMap['orderitems'] as List).map((i) => OrderItems.fromJSON(i)).toList()
    );
  } 
}