// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:wixApp/helper/FoodsCarouselWidget.dart';
// import 'package:wixApp/model/product.dart';
// import 'package:wixApp/service/Service.dart';

// class FoodsCarouselWidget extends StatefulWidget {
//   FoodsCarouselWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   _FoodsCarouselWidgetState createState() => _FoodsCarouselWidgetState();
// }

// class _FoodsCarouselWidgetState extends State<FoodsCarouselWidget> {
//   // List<Product> categoryList = List<Product>();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getItems();
//   // }
//   // Services _services = Services();
//   // void getItems() async{
//   //     await _services.getCouponList().then((value){
//   //       setState(() {
//   //         categoryList=value;
//   //       });
//   //     });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 210,
//         color: Theme.of(context).primaryColor,
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: ListView.builder(
//           itemCount:categoryList.length,
//           itemBuilder: (context, index) {
//             double _marginLeft = 0;
//             (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
//             // return FoodsCarouselItemWidget(
//             //     categoryid: categoryList[index].id.toString(),
//             //     categoryname: categoryList[index].product_name,
//             //     imagePath: categoryList[index].product_image,
//             //     marginLeft: _marginLeft,
//             //   );
//           },
//           scrollDirection: Axis.horizontal,
//         ));
//   }
// }