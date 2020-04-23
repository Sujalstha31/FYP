import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  Compare({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  int _counter = 0;

  

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        // The containers in the background
        new Container(     
            color: Colors.red,
            child: Row(
              children: <Widget>[
                    new GestureDetector(
                      onTap: (){
                        print('object');
                      },
                        child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height,
                   color: Colors.orange,
                   
                ),
                    ),
                GestureDetector(
                      onTap: (){
                        setState(() {
                          
                        });
                      },
                        child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height,
                   color: Colors.yellow,
                   
                ),
                    ),
                
              ],
            ),
        
        ),
        // The card widget with top padding,
        // incase if you wanted bottom padding to work,
        // set the `alignment` of container to Alignment.bottomCenter
        // Row(
        //   children: <Widget>[
        //      Container(
        //   margin: EdgeInsets.only(top: 230),
        //   padding: EdgeInsets.symmetric(horizontal: 30),
        //   color: Colors.red,
        //   height: 310.0,
          
        // ),
        //   ],
        // ),
       
      ],
    );
  }
}
