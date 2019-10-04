import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_demo/home/homeDrawer.dart';
import 'package:flutter_shopping_demo/productdetails/productDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _dummyItems = ["Shirt", "Pant", "Baby", "Book"];

  String _name = "";

  Future getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString("usreName");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search),
            onPressed: (){},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){},
            color: Colors.white,
          ),
        ],
      ),
      drawer: HomeDrawer(context,_name),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/red_t_shirt.jpg",
              height: 150,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Category",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              height: 130,
              child: ListView.builder(
                itemCount: _dummyItems.length,
                itemBuilder: _categoryItem,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Recently added",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              height: 130,
              child: ListView.builder(
                itemCount: _dummyItems.length,
                itemBuilder: _categoryItem,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  * Category item widget. It is same things of recycler view 
  * item. And inside item the behavior like adapter
  *
  * */
  Widget _categoryItem(BuildContext context, int index) {
    return SizedBox(
      width: 120.0,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProductDetails(_dummyItems[index])));
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                "images/blue_t_shirt.jpg",
                height: 100,
                fit: BoxFit.fitHeight,
                width: 100,
              ),
              Text(_dummyItems[index])
            ],
          ),
        ),
      ),
    );
  }
}
