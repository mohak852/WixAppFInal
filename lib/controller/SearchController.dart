import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/repo/searchRepo.dart';
import 'package:wixApp/service/Service.dart';

class SearchController extends ControllerMVC {
  List<Product> products = <Product>[];

  SearchController() {
    listenForProducts();
  }

  Services _services = Services();
  void listenForProducts({String search}) async {
    final List<Product> stream = await _services.getSearchList(search);
    if(search!=null){((Product _product) {
        setState(() => products.add(_product));
    });}
  }

  Future<void> refreshSearch(search) async {
    setState(() {
      products = <Product>[];
    });
    listenForProducts(search: search);
  }
  void saveSearch(String search) {
    setRecentSearch(search);
  }
}
