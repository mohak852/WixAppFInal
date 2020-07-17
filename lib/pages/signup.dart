//import 'package:dimsumv1/src/elements/BlockButtonWidget.dart';
import 'package:wixApp/Costants/Constants.dart';
import 'package:wixApp/helper/BlockButtonWidget.dart';
import 'package:wixApp/service/Service.dart';
import 'package:flutter/material.dart';
import 'package:wixApp/config/app_config.dart' as config;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController passwordController = TextEditingController();
  ProgressDialog pr;
  bool _hidepassword = true;
  Services _Services = Services();
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
      key: globalKey,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: config.App(context).appWidth(100),
              height: config.App(context).appHeight(37),
              decoration: BoxDecoration(color: Color(0xffdf6589ff)),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(37) - 120,
            child: Container(
              width: config.App(context).appWidth(84),
              height: config.App(context).appHeight(37),
              child: Text(
                'Login!',
                style: kLoginStyle,
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(37) - 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                    )
                  ]),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
              width: config.App(context).appWidth(88),
              //  height: config.App(context).appHeight(55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    autofocus: false,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color:  Colors.white),
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'miralia@gmail.com',
                      hintStyle: TextStyle(color:  Colors.white),
                      prefixIcon: Icon(Icons.alternate_email, color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(
                        color: Colors.white
                    ),
                    autofocus: false,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: this._hidepassword?true:false,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(12),
                      hintText: '••••••••••••',
                      hintStyle: TextStyle(color:  Colors.white.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.lock_outline, color:  Colors.white),
                      suffixIcon: GestureDetector(
                        onTap: (){

                          setState(() {
                            this._hidepassword= !this._hidepassword ;
                          });
                        },
                        child: Icon(
                            Icons.remove_red_eye, color:this._hidepassword?  Colors.white:Colors.blue),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 30),
                  BlockButtonWidget(
                    text: Text(
                      'Login',
                      style: kButtonStyle,
                    ),
                    color: Colors.black,
                    onPressed: () async {

                      if(emailController.text == "" && passwordController.text == ""){

                        globalKey.currentState.showSnackBar(SnackBar(
                            backgroundColor: Theme.of(context).focusColor.withOpacity(0.8) ,
                            content: Text("Please Fill Email and Password",style: kSnackBarStyle,)));
                      }
                      else{
                        pr.show();
                        await _Services.LoginUser(emailController.text, passwordController.text).then((value){
                          pr.hide();
                          if(value is String){
                            globalKey.currentState.showSnackBar(SnackBar(
                                backgroundColor: Theme.of(context).focusColor.withOpacity(0.8) ,
                                content: Text("Login Success",style: kSnackBarStyle,)));
                            Navigator.of(context).pushNamed('/Dash');
                          }
                          else {
                            globalKey.currentState.showSnackBar(SnackBar(
                                backgroundColor: Theme.of(context).focusColor.withOpacity(0.8) ,
                                content: Text("Invalid Credentials",style:kSnackBarStyle,)));
                          }
                        });
                      }
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/Pages', arguments: 2);
                  },
                  textColor: Theme.of(context).hintColor,
                  child: Text('I forgot password ?'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/SignUpWidget');
                  },
                  textColor: Theme.of(context).hintColor,
                  child: Text('I don\'t have an account?'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
