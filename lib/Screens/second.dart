import 'package:flutter/material.dart';
import 'package:over/Class/bikesString.dart';
import '../fonts/calendar_icons.dart';
import '../fonts/my_flutter_app_icons.dart';

class SecondScreen extends StatefulWidget {
  final Bike value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[250],
      //backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(title: new Text('  ${widget.value.name}')),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new NetworkImage(
                  "https://images.unsplash.com/photo-1530508777238-14544088c3ed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            color: Colors.black,
                            offset: Offset(4, 4))
                      ] // make rounded corner of border
                      ),
                  child: new Column(
                    // child: Column(
                    children: <Widget>[
                      Padding(
                        //`widget` is the current configuration. A State object's configuration
                        //is the corresponding StatefulWidget instance.
                        child: Image.network('${widget.value.imageUrl}'),
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 258),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(
                              7.0)), // set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 6,
                            color: Colors.black,
                            offset: Offset(3, 0))
                      ],
                    ),
                    //width: 400,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      //margin: EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                              ),
                              Padding(
                                child: new Text(
                                  'NAME:${widget.value.name} ',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Padding(
                                child: new Text(
                                  '|',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                  textAlign: TextAlign.left,
                                ),
                                padding: EdgeInsets.only(left: 30),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                              ),
                              Padding(
                                child: new Text(
                                  'Price : ${widget.value.price}',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                                padding: EdgeInsets.only(top: 10.0),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(58, 66, 86, 1.0), //grey[300],
                // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0)), // set rounded corner radius
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6, color: Colors.black, offset: Offset(3, 0))
                ],
              ),
              //width: 400,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                        ),
                        Padding(
                          child: new Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.only(right: 0),
                        ),
                        Padding(
                          child: new Text(
                            'Overview',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Padding(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.motorcycle,
                                  size: 35, color: Colors.white),
                              Text(
                                'Bike Number',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(left: 25.0),
                        ),
                        Padding(
                          child: Column(
                            children: <Widget>[
                              Icon(Calendar.calendar_full,
                                  size: 35, color: Colors.white),
                              Text(
                                'Model Year',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(left: 67.0),
                        ),
                        Padding(
                          child: Column(
                            children: <Widget>[
                              Icon(MyFlutterApp.road,
                                  size: 35, color: Colors.white),
                              Text(
                                'KM Driven',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(left: 80.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        Padding(
                          child: new Text(
                            ' ${widget.value.lot}',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(right: 1.0),
                        ),
                        Padding(
                          child: new Text(
                            ' ${widget.value.modelYear}',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(left: 64.0),
                        ),
                        Padding(
                          child: new Text(
                            ' ${widget.value.kilometer}',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(left: 80.0),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 4),
                        Padding(
                          child: new Text(
                            'Insuracne: Available',
                            // 'Insuracne: ${widget.value.modelYear}',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(right: 0.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 60.0),
                        ),
                        Padding(
                          child: new Text(
                            'Tax : ${widget.value.tax}',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(left: 7.0),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Color.fromRGBO(58, 66, 86, 1.0), //grey[300],
                // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0)), // set rounded corner radius
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6, color: Colors.black, offset: Offset(4, 4))
                ],
              ),
              // color: Colors.grey[200],

              //margin: EdgeInsets.symmetric(vertical: 4),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 70),
                        ),
                        Padding(
                          child: new Text(
                            'Descriptions  : ${widget.value.desciption} ',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              color: Colors.grey[250],
              padding: EdgeInsets.symmetric(horizontal: 110),
              margin: EdgeInsets.only(bottom: 10.0),
              width: 0.0,
              height: 40.0,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.lightBlueAccent)),
                  color: Colors.red,
                  child: Text(
                    "Get Seller Details",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  elevation: 6.0,
                  onPressed: () => details(context)),
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  void details(BuildContext context) {
    var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        //title: Text('Bike Number : ${widget.value.lot}'),
        content: Container(
            decoration: BoxDecoration(
                color: Colors.white, //grey[300],
                // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6, color: Colors.black, offset: Offset(4, 4))
                ] // make rounded corner of border
                ),
            height: 140,
            child: Column(
              children: <Widget>[
                Padding(
                  child: new Text(
                    'Name : ${widget.value.uname}',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    'Number : ${widget.value.number}',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: new Text(
                    'Location : ${widget.value.address}',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            )));

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
