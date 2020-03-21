import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() { 
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
          center: Alignment.center,
          colors: [
            Colors.white,
            Theme.of(context).primaryColor,
          ]
        )
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 3
            ),
            borderRadius: BorderRadius.circular(80)
          ),
          width: 100,
          height: 100,
          child: ClipOval(child: Image.asset('images/sunblogsave_logo.png', fit: BoxFit.cover)),
        ),
      ),
    );
  }
}