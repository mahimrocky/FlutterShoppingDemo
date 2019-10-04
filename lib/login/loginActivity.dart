import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  bool isShow = false;
  bool _isRememberMeChecked = false;

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isUserNameEmpty = true;
  bool _isPasswordEmpty = true;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff9C48E2),
              Color(0xffBA53C6),
              Color(0xffE86493),
              Color(0xffF26A74),
            ],
          ),
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: Image.asset("images/dummy_logo.png",height: 200,),
              ),

              // user name field

              Theme(
                data: ThemeData(
                    primaryColor: Colors.white54,
                    primaryColorDark: Colors.white54),
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      errorText: _isUserNameEmpty?"User name can\'t be empty":null,
                      errorStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white54,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Password field

              Theme(
                data: ThemeData(
                    primaryColor: Colors.white54,
                    primaryColorDark: Colors.white54),
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      errorText: _isPasswordEmpty?"Password can\'t be empty":null,
                      errorStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white54,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
              ),

              // check box
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.white54,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 8),
                  child: CheckboxListTile(
                    title: Text(
                      "Remember me",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    value: _isRememberMeChecked,
                    onChanged: rememberMeCheckBoxListener,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ),

              // Login button
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Color(0xFFE16188),
                    ),
                  ),
                  onPressed: saveLoginData,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
              ),

              // Register button

              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Color(0x26000000),
                ),
              ),

              // Forget password text
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "Forgot your password",
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void rememberMeCheckBoxListener(bool value) {
    setState(() {
      _isRememberMeChecked = value;
    });
  }

  void saveLoginData(){
      setState(() async {
        String userName = _userNameController.text;
        String password = _passwordController.text;

        if(userName.length==0){
          _isUserNameEmpty = true;
        }else{
          _isUserNameEmpty = false;
        }

        if(password.length==0){
          _isPasswordEmpty = true;
        }else{
          _isPasswordEmpty = false;
        }

        // now save data in shared preference

        if(userName.length!=0 && password.length!=0){
          var preference = await SharedPreferences.getInstance();
          preference.setString("usreName", userName);
          preference.setString("password", password);

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
        }
       
        
      });

  }
}
