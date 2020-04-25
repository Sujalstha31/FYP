import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:over/Class/bikesString.dart';
import 'package:over/Screens/cart.dart';
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

class Bikes extends StatefulWidget {
  @override
  _BikesState createState() => _BikesState();
}

class _BikesState extends State<Bikes> {
  //List<Bike> _cartList = List<Bike>();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Used Bikes'),
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
 

  @override
 
  
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
   
  TextEditingController editingController = TextEditingController();
  List<Bike> bikesToCompare = List<Bike>();
  Widget build(context) {
    return Stack(
      children: <Widget>[
        Padding(
              padding: const EdgeInsets.only(top:00),
              child: TextField(
                onChanged: (value) {
                  //filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            SizedBox(height:20),
        GridView.builder(
          padding: const EdgeInsets.only(top:70),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
          itemCount: widget.bikes.length,
          itemBuilder: (context, int currentIndex) {
            return createViewItem(widget.bikes[currentIndex], context);
          },
        ),
        //if (bikesToCompare.length > 1){
        if (bikesToCompare.isNotEmpty)
          Positioned(
            bottom: 10.0,
            left: 100,
            right: 100.0,
            child: RaisedButton(
              onPressed: () {
                if (bikesToCompare.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(bikesToCompare),
                    ),
                  );
                else
                  print('object');
              },
              child: Text(
                "Compare" +
                    " " +
                    bikesToCompare.length.toString() +
                    " " +
                    'bikes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget createViewItem(Bike bike, BuildContext context) {

    return new ListTile(
        title: new Card(
          elevation: 1.0,
          child: new Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6, color: Colors.black, offset: Offset(4, 4))
                ]),
            padding: EdgeInsets.all(1.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      child: Text(
                        bike.name,
                        style: GoogleFonts.caveatBrush(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Padding(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: (!bikesToCompare.contains(bike))
                              ? Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                )
                              : Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                          onTap: () {
                            setState(
                              () {
                                if (!bikesToCompare.contains(bike))
                                  bikesToCompare.add(bike);
                                   
                                else
                                  bikesToCompare.remove(bike);
                              },
                            );
                          },
                        ),
                      ),
                      padding: EdgeInsets.only(right: 8),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Padding(
                  child: Image.network(bike.imageUrl),
                  padding: EdgeInsets.only(bottom: 0.0),
                ),
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
