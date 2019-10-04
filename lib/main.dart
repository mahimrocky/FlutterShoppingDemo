import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_shopping_demo/home/home.dart';
import 'package:flutter_shopping_demo/login/loginActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, gotoHome);
  }

  gotoHome() async {
    print("Go home call");
    //navigator.currentState.push(MaterialPageRoute(builder: (__) => HomePage()),);
    final preference = await SharedPreferences.getInstance();
    bool isRegistered = preference.getBool("IS_REGISTERD");
    if(isRegistered!=null && isRegistered){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginActivity()));
    }

  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/splash.jpg"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
