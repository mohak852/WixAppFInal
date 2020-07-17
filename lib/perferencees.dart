import 'package:shared_preferences/shared_preferences.dart';
import 'model/user.dart';

class Preferences {
  
   Future<bool> setWalkThrough() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("WalkThrough", true);
  }

   Future<bool> getWalkThrough() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("WalkThrough") ?? false;
  }

   Future<bool> setToken(String authToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("authToken", authToken);
  }

  Future<bool> setId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("id", id);
  }
   Future<bool> setAddress(String address) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("address", address);
  }

   Future<String> getData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("$data") ?? "";
  }

   Future<bool> setUser(
      [String email, String name, String phone, String authToken,String city,String landmark,String id]) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(phone);  
    print(city);  
    print(landmark);
    print(name);
    print("________AuthToken___");
    print(authToken);
    if(email!=null)prefs.setString("email", email);
    if(name!=null)prefs.setString("name", name);
    if(city!=null)prefs.setString("city", city);
    if(landmark!=null)prefs.setString("landmark", landmark);
    if(phone!=null)prefs.setString("phone", phone.toString());
    if(landmark!=null ||city!=null)prefs.setString("address", "$landmark,$city");
    if(authToken!=null)prefs.setString("authToken", authToken);
    if(id!=null)prefs.setString("id", id);
    return true;
  }
   Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = User();
    user.address = prefs.getString("address")?? "";
    user.authToken  = prefs.getString("authToken")?? "";
    user.email = prefs.getString("email")?? " ";
    user.phone = prefs.getString("phone")?? " ";
    user.name = prefs.getString("name")?? " ";
    user.landmark = prefs.getString("landmark")??" ";
    user.city = prefs.getString("city")??" ";
    return user;
  }

   Future<bool> removeUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
 
}
