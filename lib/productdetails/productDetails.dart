import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  String title;

  ProductDetails(@required this.title);

  @override
  State<StatefulWidget> createState() => _ProductDetailsState(this.title);
}

class _ProductDetailsState extends State<ProductDetails> {
  String title;

  _ProductDetailsState(@required this.title) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  "images/red_t_shirt.jpg",
                  height: 180,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Icon(Icons.favorite_border),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: Text("120 USD"),
                )
              ],
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 16),
              alignment: Alignment.topLeft,
              child: Card(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              this.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text("0.0"),
                                RatingBar(
                                  direction: Axis.horizontal,
                                  itemSize: 20.0,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Text("0 reviews")
                              ],
                            )
                          ],
                        ),
                        RaisedButton(
                          child: Text("Order"),
                          color: Colors.lightBlueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Product Name: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              this.title,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Description: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                dummyText,
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ";
}
