import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:over/Class/bikesString.dart';
//import 'dish.dart';

class Cart extends StatefulWidget {
  final List<Bike> bikesToCompare;

  Cart(this.bikesToCompare);

  @override
  _CartState createState() => _CartState(this.bikesToCompare);
}

class _CartState extends State<Cart> {
  _CartState(this.bikesToCompare);

  List<Bike> bikesToCompare;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carst'),
      ),
      body: Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.bikesToCompare.length,
            itemBuilder: (context, index) {
              var item = widget.bikesToCompare[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Container(
                  child: Card(
                      elevation: 4.0,
                      child: new ListTile(
                          title: new Container(                                           
                              padding: EdgeInsets.all(2.0),
                              margin: EdgeInsets.all(0.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        child: Text(
                                          item.name,
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
                                                Icons.remove_circle,
                                                color: Colors.red,
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  bikesToCompare.remove(item);
                                                });
                                              }),
                                        ),
                                        padding: EdgeInsets.only(right: 8),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Padding(
                                    child: Image.network(item.imageUrl),
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
                                          item.price,
                                          style: GoogleFonts.caveatBrush(
                                              fontSize: 24, color: Colors.red),
                                          textAlign: TextAlign.center,
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 01.0)),
                                    SizedBox(height: 35),
                                  ]),
                                ],
                              ),
                            ),
                          // ),
                          onTap: () {
                            // var route = new MaterialPageRoute(
                            //   builder: (BuildContext context) => new SecondScreen(value: bike),
                            // );
                            // Navigator.of(context).push(route);
                          })
                      // child: ListTile(
                      //   leading: Icon(
                      //     Icons.add,
                      //     // item.name,
                      //     // color: item.color,
                      //   ),
                      //   title: Text(item.price),
                      //   trailing: GestureDetector(
                      //       child: Icon(
                      //         Icons.remove_circle,
                      //         color: Colors.red,
                      //       ),
                      //       onTap: () {
                      //         setState(() {
                      //           bikesToCompare.remove(item);
                      //         });
                      //       }),
                      // ),
                      ),
                ),
              );
            }),
      ),
    );
  }
}
