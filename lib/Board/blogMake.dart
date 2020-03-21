
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlocMakePage extends StatefulWidget {
  BlocMakePage({Key key}) : super(key: key);

  @override
  _BlocMakePageState createState() => _BlocMakePageState();
}

class _BlocMakePageState extends State<BlocMakePage> {

  @override
  void initState() { 
    super.initState();
  }

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _blogController = new TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 100,
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
    );
  }

  int _indexOfChip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('블로그 만들기 페이지'),
      ),
      body: null,
    );
  }
}