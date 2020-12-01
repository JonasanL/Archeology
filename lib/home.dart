import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'dart:math';
import 'LithicPage.dart';
import 'database.dart';

int update = 0;

/*
Custom class that implement the home screen layout
 */
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: HomeScreenButton());
  }
}

class HomeScreenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CustomButtonColumn();
  }
}

class CustomButtonColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomButtonColumn();
}

class _CustomButtonColumn extends State<CustomButtonColumn> {
  String latitude = "locating";
  String longitude = "locating";
  Timer getLocation;
  Timer updateLocation;

  Future<void> _getLocation() async {
    try {
      Position position;
      if (await Geolocator.isLocationServiceEnabled()) {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 1));
        print(position.longitude);
      }

      if (!mounted && position == null) {
        return;
      }
      this.latitude = position.latitude.toString();
      this.longitude = position.longitude.toString();
    } catch (e) {}
  }

  void _update() {
    setState(() {});
  }

  @override
  void initState() {
    const fiveSeconds = const Duration(seconds: 1);
    getLocation = Timer.periodic(fiveSeconds, (Timer t) => _getLocation());
    updateLocation = Timer.periodic(fiveSeconds, (Timer t) => _update());
    super.initState();
  }

  @override
  void dispose() {
    getLocation.cancel();
    updateLocation.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Spacer(),
        CustomButtonRow("Lithic", "GroundStone"),
        Spacer(),
        CustomButtonRow("Bone", "Ceramic"),
        Spacer(),
        CustomButtonRow("Metal", "FAR"),
        Spacer(),
        CustomButtonRow("Feature", "Other"),
        Spacer(),
        Text("Latitude: " + latitude),
        Spacer(),
        Text("Longitude: " + longitude),
        Spacer(),
        LithicButton("Lithic"),
        Spacer()
      ],
    );
  }
}

class CustomButtonRow extends StatelessWidget {
  String firstlabel;
  String secondlabel;

  CustomButtonRow(String firstlabel, String secondlabel) {
    this.firstlabel = firstlabel;
    this.secondlabel = secondlabel;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        Spacer(),
        Icon(Icons.museum),
        CustomHomeButton(firstlabel),
        Spacer(),
        Icon(Icons.museum),
        CustomHomeButton(secondlabel),
        Spacer(),
      ],
    );
  }
}

/*
Custom Home Button that is used to display common archeology label
It contains one image and one text that retreat from database
 */

class CustomHomeButton extends StatelessWidget {
  String label;

  void addRecord() async{
    try {
      Position position;
      if (await Geolocator.isLocationServiceEnabled()) {
        position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 1));
    }

    String latitude = position.latitude.toString();
    String longitude = position.longitude.toString();


    SQLiteDatabase db = new SQLiteDatabase();
    List<Record> temp = await db.getAllRecord();


    final record = Record(id : temp.length, user: "default", project: "testing", device: "android", artifact: label, latitude: latitude, longitude: longitude);

    await db.insertRecord(record);
    }
    catch (e) {}

  }

  CustomHomeButton(String label) {
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(label),
      onPressed: addRecord,
      color: Colors.amber,
      height: 40,
      minWidth: 120,
    );
  }
}

class LithicButton extends CustomHomeButton {
  String label;
  LithicButton(String label) : super(label) {
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(this.label),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LithicPage()));
      },
      color: Colors.amber,
      height: 40,
      minWidth: 120,
    );
  }
}