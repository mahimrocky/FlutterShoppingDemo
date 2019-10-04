import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget{
  BuildContext _context;
  String _name;
  HomeDrawer(this._context,this._name){
  }

  void closeDrawer(){
    Navigator.pop(_context);
  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(this._name),
            accountEmail: Text("johndoe@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "J",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            title: Text("Home"),
            onTap: (){
              closeDrawer();
            },
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text("Favourite"),
            onTap: (){
              closeDrawer();
            },
            leading: Icon(Icons.favorite),
          ),
          ListTile(
            title: Text("Hot Collection"),
            onTap: (){
              closeDrawer();
            },
            leading: Icon(Icons.whatshot),
          ),
          ListTile(
            title: Text("About us"),
            onTap: (){
              closeDrawer();
            },
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("Help"),
            onTap: (){
              closeDrawer();
            },
            leading: Icon(Icons.help),
          ),
          ListTile(
            title: Text("Logout"),
            onTap: (){
              closeDrawer();
            },
            leading: Icon(Icons.keyboard_return),
          ),
        ],
      ),
    );;
  }

}