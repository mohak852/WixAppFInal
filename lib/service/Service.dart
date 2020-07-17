import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wixApp/model/AutoGen.dart';
import 'package:wixApp/model/Validity.dart';
// ignore: unused_import
import 'package:wixApp/model/order.dart';
import 'package:wixApp/model/product.dart';
import 'package:wixApp/model/user.dart';
import 'package:wixApp/perferencees.dart';
import 'package:html/parser.dart';

class Services {
  String base_url = "http://app.digitalcatnyx.store/api/";
  Preferences _preferences = Preferences();
  Future<dynamic> registerUser(
    String name, String password, String email, String phone) async {
      Map data = {
      "name": name,
      "email": email,
      "password": password,
      "address": phone,
    };
    var responce = await http.post("${base_url}register",body: data);
    var jsonData=null;
    if (responce.statusCode == 200) {
      jsonData = json.decode(responce.body);
      print("User is Registered succesfully");
      return jsonData["success"]["token"];
    }
    else{
      return false;
    }
   
  }

  Future<List<Product>> getSearchList(String search) async {
    Map searchResults = {
      "ProductName": "$search"
    };
    final response = await http.post(
      Uri.encodeFull("${base_url}productsearch"),
      body: searchResults,
      headers: {"Accept": "application/json"});
    var responseJson = jsonDecode(response.body);
    List data = responseJson["success"];
    int totalCoupons = data.length;
    print(data);
    List<Product> ProductDetail = List<Product>();
    for (int i = 0; i < totalCoupons; i++) {
      ProductDetail.add(Product.fromJSON(data[i]));
    }
    return ProductDetail;
  }
  Future<List<Product>> getCouponList() async {
    final response = await http.get(Uri.encodeFull("${base_url}products"),headers: {"Accept": "application/json"});
    var responseJson = jsonDecode(response.body);
    List data = responseJson["success"];
    int totalCoupons = data.length;
    List<Product> ProductDetail = List<Product>();
    for (int i = 0; i < totalCoupons; i++) {
      ProductDetail.add(Product.fromJSON(data[i]));
    }
    return ProductDetail;
  }
  
  

  Future<dynamic> LoginUser(String email, String password) async {
    Map data = {
      'username': email,
      'password': password,
    };
    print(data);
    final response = await http.post(
      "${base_url}login",
      body: data,
    );
    var extractData = jsonDecode(response.body);
    var responseJson = extractData["success"];
   print(responseJson);
    try{if (extractData["success"].containsKey("token")) {
      print("User is logged in");
      print(responseJson);
      String landmark = responseJson["address"] != null
          ? responseJson["address"]
          : " ";
      String city = responseJson["city"] != null
          ? responseJson["city"]
          : " ";
      _preferences.setUser(
          responseJson["email"],
          responseJson["name"],
          responseJson["phone"].toString(),
          responseJson["token"],
          landmark,
          city,
          responseJson["id"].toString(),
        );
      var response = _preferences.getData("authToken");
      print("=======================================");
      print(await response);
      print("=======================================");
      return responseJson["token"];
    }} catch(e) {
      print(e);
      return extractData["status"];
    }
  }

   Future<Product> getProductbyId(String id) async {
    print(id);
    Map data1 = {
      'id': id.toString(),
    };
    final response = await http.post(
    Uri.encodeFull("${base_url}products/show"),
    body: data1,
    headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    var responseJson = data["success"];
    print(responseJson);
    int totalFood = responseJson.length;
    return Product.fromJSON(responseJson);
  }

  Future<Validity> CheckValidity() async {
    final id = await _preferences.getData("id");
    print("======Validity============Validity===");
    print(id);
    print("=============================");
    Map data1 = {
      'id': id.toString(),
    };
    final authtoken = await _preferences.getData("authToken");
    print("=====+++++++++++++++++++++++==============");
    print(authtoken);
    final response = await http.post(
    Uri.encodeFull("${base_url}orders/checkvalidity"),
    body: data1,
    headers: {
      'Authorization': 'Bearer $authtoken',
    });
    var data = jsonDecode(response.body);
    var responce = Validity.fromJSON(data);
    print("responce-=-----------------------");
    print(data);
    return responce;
  }


  Future<dynamic> LogoutUser() async {
    final authtoken = await _preferences.getData("authToken");
    print("===============================");
    print(authtoken);
    final response = await http.get(
      "${base_url}logout",
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $authtoken',
      },
    );
    print(response.body);
    _preferences.removeUser();
    return jsonDecode(response.body);
  }


  // ignore: non_constant_identifier_names
  // Future<dynamic> HistoryOrders() async {
  //   final authtoken = await _preferences.getData("authToken");
  //   print("===============================");
  //   print(authtoken);
  //   final response = await http.get(
  //     "${base_url}orders/history",
  //     headers: <String, String>{
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $authtoken',
  //     },
  //   );
  //   print("===============================History==================");
  //   print(response.body);
  //   return jsonDecode(response.body);
  // }
  Future<List<Product>> historyOrder() async {
     final authtoken = await _preferences.getData("authToken");
    final response = await http.get(
      Uri.encodeFull("${base_url}products"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authtoken',
      });
    var responseJson = jsonDecode(response.body);
    List data = responseJson["success"];
    int totalCoupons = data.length;
    List<Product> ProductDetail = List<Product>();
    for (int i = 0; i < totalCoupons; i++) {
      ProductDetail.add(Product.fromJSON(data[i]));
    }
    return ProductDetail;
  }

  Future<dynamic> getOrdersList() async {
    final authtoken = await _preferences.getData("authToken");
    print("===============================");
    print(authtoken);
    final response = await http.get(
      "${base_url}orders",
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $authtoken',
      },
    );
    print("========================Get Order List==================");
    var data = await jsonDecode(response.body);
    print(await data);
    return Success.fromJson(data);
  }


  Future<dynamic> editDetails(
      String email, String phone, String location, String house) async {
    final id = await _preferences.getData("id");
    print("=============================");
    print(id);
    print("=============================");
    final authtoken = await _preferences.getData("authToken");
    print(authtoken);
    Map editDetails = {
      'name': 'Mohak',
      'email': email,
      'address': location,
      'address2': house,
      'city': 'delhi',
      'pincode': 20022.toString(),
      'phone': phone.toString()
    };
    final response = await http.post(
      "${base_url}user/$id",
      headers: <String, String>{
       'Accept': 'application/json',
       'Authorization': 'Bearer $authtoken',
      },
      body: editDetails
    );

    var responseJson = jsonDecode(response.body);
    print(response);
    print(responseJson);
    if (responseJson.containsKey("success")){
      return true;
    }
  }
}
