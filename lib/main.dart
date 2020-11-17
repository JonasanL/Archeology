import 'dart:async';

import 'package:flutter/material.dart';
import 'navigation.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static const String _title = "Archeolog";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: NavigationBar(),
    );
  }
}








/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Archeology'),
        ),
        body: Center(
          child: Column (
              children:[
                Row(
                  children:[
                    _RaisedButtonDemo(),
                    _RaisedButtonDemo(),
                  ]

                ),
                Row(
                    children:[
                      _RaisedButtonDemo(),
                      _RaisedButtonDemo(),
                    ]

                ),
                Row(
                    children:[
                      _RaisedButtonDemo(),
                      _RaisedButtonDemo(),
                    ]

                ),
                Row(
                    children:[
                      _RaisedButtonDemo(),
                      _RaisedButtonDemo(),
                    ]

                ),
                Row(
                    children:[
                      _RaisedButtonDemo(),
                      _RaisedButtonDemo(),
                    ]

                ),
                Row(
                    children:[
                      _RaisedButtonDemo(),
                      _RaisedButtonDemo(),
                    ]

                ),
                Row(
                    children:[
                      _RaisedButtonDemo(),
                      _RaisedButtonDemo(),
                    ]

                ),


              ]
          )

        ),

      ),
    );
  }
}
*/

/*

class _RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            RaisedButton(
              child: Text("Object"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("Add"),
              onPressed: () {},
            ),
          ],
        )


      ),
    );
  }
}*/





