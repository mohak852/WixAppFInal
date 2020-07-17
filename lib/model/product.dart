class Product{
  String id;
  String product_name;
  String product_image;
  String sku;
  int stock_quantity;
  String qty;
  double product_price;
  int other_price;
  int product_category;
  String product_description;
  int user_id;
  int verified;
  int renewal_amount;
  int duration;
  Product({this.id,this.product_name,this.product_image,this.sku,this.stock_quantity,this.qty,this.product_price,
  this.other_price,this.product_category,this.product_description,this.user_id,this.verified,this.renewal_amount,this.duration});
  factory Product.fromJSON(Map<String,dynamic> jsonMap){
    return Product(
      id: jsonMap["id"].toString(),
      product_name : jsonMap['product_name'],
      product_image :  jsonMap['product_image'],
      sku : jsonMap['sku'],
      stock_quantity : jsonMap['stock_quantity'],
      qty : jsonMap['qty'],
      product_price : double.parse(jsonMap['product_price']),
      other_price : int.parse(jsonMap['other_price']),
      product_category :jsonMap['product_category'],
      product_description : jsonMap['product_description'],
      user_id : jsonMap['user_id'],
      verified :jsonMap['verified'],
      renewal_amount : jsonMap['renewal_amount'],
      duration : jsonMap['duration'],
    );
  }
}