import 'package:flutter/material.dart';


void main() => runApp(MyApp());

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

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.



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
}



