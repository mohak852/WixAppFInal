import 'package:flutter/material.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/CardWidget.dart';
import 'package:wixApp/helper/ProductItemwidget.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/repo/searchRepo.dart';
import '../service/Service.dart';
class SearchResultWidget extends StatefulWidget {
  @override
  _SearchResultWidgetState createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  TextEditingController searchText = TextEditingController();
  List<Product> couponList = new List<Product>();
  List<Product> searchList = new List<Product>();
  Services _services = Services();
  String query = "";
  @override
  void initState() {
    super.initState();
    // _isSearching = false;
    getSearch(query);
    getProductList();
  }
  void getProductList() async{
    await _services.getCouponList().then((value) {
        setState(() {
          couponList=value;
          print(couponList);
        });
    });
  }

  List<Product> products = <Product>[];

  
  void getSearch(String query) async {
    await _services.getSearchList(query).then((value){
      setState(() {
        searchList = value;
        print("-------------------------");
        print(searchList.length);
        print("--------------------------");
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              trailing: IconButton(
                icon: Icon(Icons.close),
                color: Theme.of(context).hintColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
               "Search",
                style: kSearchHeadStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onSubmitted: (text){
                getSearch(text);
              },
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: "Search For Products",
                hintStyle: Theme.of(context).textTheme.caption.merge(TextStyle(fontSize: 14)),
                prefixIcon: Icon(Icons.search, color: Theme.of(context).accentColor),
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.1))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.3))),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.1))),
              ),
            ),
          ),
          searchList==null?CircularProgressIndicator():
              Expanded(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          title: Text(
                           "Product Results",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: searchList.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          return ProductItemWidget(
                            product: searchList[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}