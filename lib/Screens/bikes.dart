import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:over/Class/bikesString.dart';
import 'dart:convert';
import 'package:over/Screens/second.dart';

Future<List<Bike>> downloadJSON() async {
  final jsonEndpoint = "http://10.0.2.2/PHP/spacecrafts/index.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List bikes = json.decode(response.body);
    return bikes.map((bike) => new Bike.fromJson(bike)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 6.0,
      ),
    ),
  );
}

class Bikes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Used Bikes'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 36.0,
                    ),
                    //if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          "sasa",
                          // _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // if (_cartList.isNotEmpty)
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => Cart(_cartList),
                  //     ),
                  //   );
                },
              ),
            )
          ],
        ),
        body: new Center(
          child: new FutureBuilder<List<Bike>>(
            future: downloadJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Bike> bikes = snapshot.data;
                return new CustomListView(bikes);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class CustomListView extends StatefulWidget {
  final List<Bike> bikes;
  CustomListView(this.bikes);
  List<Bike> sujal = List<Bike>();
  List<Bike> _cartList = List<Bike>();
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  Widget build(context) {
    setState(() {
      widget.sujal = widget.bikes;
    });
    return ListView.builder(
      itemCount: widget.bikes.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(widget.bikes[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Bike bike, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 2.0,
          child: new Container(
            decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6, color: Colors.black, offset: Offset(4, 4))
                ] 
                ),
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Padding(
                      child: Text(
                        bike.name,
                        style: GoogleFonts.caveatBrush(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.only(left: 100),
                    ),
                    Padding(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          ),
                          onTap: () {
                            setState(() {
                    //           if (!_cartList.contains(item))
                    //   _cartList.add(item);
                    // else
                    //   _cartList.remove(item);
                             });
                            print('object');
                          },
                        ),
                      ),
                      padding: EdgeInsets.only(left: 100),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Padding(
                  child: Image.network(bike.imageUrl),
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 110),
                  ),
                  Text(
                    " Price: ",
                    style: GoogleFonts.caveatBrush(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                      child: Text(
                        bike.price,
                        style: GoogleFonts.caveatBrush(
                            fontSize: 24, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 01.0)),
                  SizedBox(height: 35),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: bike),
          );
          Navigator.of(context).push(route);
        });
  }
}

// void main() {
//   runApp(Bikes());
// }

