import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/config/app_config.dart' as config;
import 'package:wixApp/model/user.dart';
import 'package:wixApp/perferencees.dart';
import 'package:wixApp/service/Service.dart';

class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Services _services = Services();
  User user;
  bool compelteProfile=false ;
  ProgressDialog pr ;
  TextEditingController emailController =new TextEditingController();
  TextEditingController contactController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController houseController = new TextEditingController();
  final gglobalKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    initPrefs();
  }
  Preferences _prefs = Preferences();
  void initPrefs() async {
    await _prefs.getUser().then((value) {
      setState(() {
        user = value;
        if (value.address != " " && value.city != " ")
        {
          compelteProfile=true;
        }
        emailController.text=value.email;
        contactController.text=value.phone;
        print(value.phone);
        print("++++++++++++++++++++++++++++++++++++++++++++");
        cityController.text=value.address;
        houseController.text=value.city;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context,
        isDismissible: false,
        customBody: Container(
            color: Colors.transparent,
            child: SpinKitCubeGrid(color: Theme.of(context).accentColor,
            )));
    pr.style(
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      key: gglobalKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: kMyProfileStyle
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/pc.jpg'),
            ),
            ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(
                Icons.person_pin,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                "Personal Details",
                style: kTextFieldStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextFormField(
                autofocus: false,
                readOnly: true,
                initialValue: this.user.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  contentPadding: EdgeInsets.all(12),
                  hintText: user.email,
                  hintStyle: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(0.7)),
                  prefixIcon: Icon(Icons.alternate_email,
                      color: Theme.of(context).accentColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                          Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                autofocus: false,
                readOnly: true,
                initialValue: "+91-${this.user.phone}",
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Contact No.",
                  labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  contentPadding: EdgeInsets.all(12),
                  hintText: this.user.address,
                  hintStyle: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(0.7)),
                  prefixIcon: Icon(Icons.phone_iphone,
                      color: Theme.of(context).accentColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                          Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                autofocus: false,
                readOnly: true,
                initialValue: user.address,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "City,State",
                  labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  contentPadding: EdgeInsets.all(12),
                  hintText: this.user.city,
                  hintStyle: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(0.7)),
                  prefixIcon: Icon(Icons.location_city,
                      color: Theme.of(context).accentColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                          Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                autofocus: false,
                readOnly: true,
                initialValue: user.address,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "House Address",
                  labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  contentPadding: EdgeInsets.all(12),
                  hintText: this.user.city,
                  hintStyle: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(0.7)),
                  prefixIcon:
                  Icon(Icons.home, color: Theme.of(context).accentColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                          Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor.withOpacity(0))),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onEditPress();
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          compelteProfile?Icons.edit:Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onEditPress() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Edit details",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,

                        // initialValue: user.email,
                        controller:emailController ,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                          TextStyle(color: Theme.of(context).hintColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Add New Email',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .hintColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.alternate_email,
                              color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // initialValue: user.phone,
                        controller:contactController ,
                        keyboardType: TextInputType.phone,
                        //  maxLength: 10,

                        decoration: InputDecoration(

                          labelText: "Phone No",
                          labelStyle:
                          TextStyle(color: Theme.of(context).hintColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Add New Email',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .hintColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.phone_android,
                              color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // initialValue: user.location,
                        controller:cityController ,

                        decoration: InputDecoration(
                          labelText: "City,State",
                          labelStyle:
                          TextStyle(color: Theme.of(context).hintColor),
                          contentPadding: EdgeInsets.all(12),
                          // hintText: 'Add New Email',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .hintColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.location_city,
                              color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // initialValue: user.house,
                        controller:houseController ,

                        decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle:
                          TextStyle(color: Theme.of(context).hintColor),
                          contentPadding: EdgeInsets.all(12),
                          // hintText: 'Add New Email',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .hintColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.home,
                              color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()async {

                        if(emailController.text.trim() == "" && cityController.text.trim() == "" && contactController.text.trim() == ""&& houseController.text.trim() == "")
                        {   Navigator.pop(context);
                        gglobalKey.currentState.showSnackBar(SnackBar(
                            backgroundColor: Theme.of(context).focusColor.withOpacity(0.8) ,
                            content: Text("Fill All Details",style: Theme.of(context).textTheme.body2,)));
                        } else if(contactController.text.length<8)
                        {      Navigator.pop(context);
                        gglobalKey.currentState.showSnackBar(SnackBar(
                            backgroundColor: Theme.of(context).focusColor.withOpacity(0.8) ,
                            content: Text("Invalid phone",style: Theme.of(context).textTheme.body2,)));
                        }
                        else{
                          //  Navigator.pop(context);
                          await  _services.editDetails(emailController.text, contactController.text, cityController.text, houseController.text).then((value){
                            Navigator.of(gglobalKey.currentContext).pushNamed('/');
                          });
                        }



                      },
                      child: Container(
                          decoration:BoxDecoration(
                            boxShadow:  [
                              BoxShadow(
                                  color: Theme.of(context).focusColor.withOpacity(0.4),
                                  blurRadius: 40,
                                  offset: Offset(0, 15)),
                              BoxShadow(
                                  color: Theme.of(context).focusColor.withOpacity(0.4),
                                  blurRadius: 13,
                                  offset: Offset(0, 3))
                            ],
                            shape: BoxShape.circle,
                            color: Theme.of(context).hintColor,
                          ) ,
                          height: 50,
                          width: 50,
                          // color: Theme.of(context).hintColor,
                          // onPressed: () {},
                          child: Center(
                            child: Text("SAVE",
                                style: TextStyle(
                                    color: Colors.white
                                )),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
