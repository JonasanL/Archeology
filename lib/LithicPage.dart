import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LithicPage extends StatefulWidget {
  //create a form
  @override
  _LithicPage createState() {
    return _LithicPage();
  }
}

class _LithicPage extends State<LithicPage>
    with SingleTickerProviderStateMixin {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // allow the text field to be brought into focus
  AnimationController _controller;
  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // actual animation funcion
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  // Widget CustomTextField() {
  //   return new Material(
  //       child: TextFormField(
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         return 'Please enter some text';
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: 'Notes',
  //     ),
  //   ));
  // }

  void onPressedSubmitButton() {
    // check if database exists, otherwise create it
    // move database code to separate file later on
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      //resizeToAvoidBottomPadding: false, // this avoids the overflow error
      appBar: AppBar(
        title: Text('Lithic'),
      ),
      body: new GestureDetector(
        // to dismiss the keyboard when the user tabs out of the TextField
        //splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              //SizedBox(height: _animation.value),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Notes',
                ),
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                focusNode: _focusNode,
              ),
              ElevatedButton(
                  onPressed: onPressedSubmitButton, child: Text('Submit'))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
