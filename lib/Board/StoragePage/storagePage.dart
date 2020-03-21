import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  StoragePage({Key key}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text('보관함'),
        ),
        SliverFillRemaining(
          child: Center(
            child: Text('보관함'),
          ),
        )
      ],
    );
  }
}