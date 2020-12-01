
import 'dart:async';
import 'package:flutter/material.dart';
import 'database.dart';


class RecordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: RecordListView());
  }
}

class RecordListView extends StatelessWidget {
  Future<List<Record>> _getRecords() async{
    SQLiteDatabase db = new SQLiteDatabase();
    return db.getAllRecord();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getRecords(),
        builder: (context, AsyncSnapshot<List<Record>> snapshot) {
          if (snapshot.hasData) {
            List<Record> allrecords = snapshot.data;
            print(allrecords.length);
            return new Scaffold(
                body: new ListView.builder
                  (
                    itemCount: allrecords.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return ListTile(
                        title: new CustomRecordRow(allrecords[index]),
                      );new CustomRecordRow(allrecords[index]);
                    }
                ) // ListView.builder() shall be used here.
            );

          } else {
            return Text("Loading");
          }
        }
    );
  }
}



/*
class RecordListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecordListView();
}


class _RecordListView extends State<RecordListView> {

  Widget build(BuildContext context) {

  }
}
*/


class CustomRecordRow extends StatelessWidget {
  Record record;

  CustomRecordRow(Record record) {
    this.record = record;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(record.id.toString()),
        Spacer(),
        Text(record.artifact),
        Spacer(),
        Text(record.latitude),
        Spacer(),
        Text(record.longitude)
      ],
    );
  }

}



