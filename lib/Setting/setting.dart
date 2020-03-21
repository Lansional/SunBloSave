import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void _changeBrightness() {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark ? Brightness.light : Brightness.dark);
  }

  void _changeColor(Color colors) {
    DynamicTheme.of(context).setThemeData(new ThemeData(
      primaryColor: Theme.of(context).primaryColor == colors ? Theme.of(context).primaryColor : colors
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 25,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text('색상변경', style: TextStyle(fontSize: 15)),
          ),
          ListTile(
            title: Text('파랑색'),
            leading: Container(
              width: 20,
              height: 20,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => _changeColor(Colors.blue)
          ),
          ListTile(
            title: Text('초록색'),
            leading: Container(
              width: 20,
              height: 20,
              color: Colors.green,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => _changeColor(Colors.green)
          ),
          ListTile(
            title: Text('빨간색'),
            leading: Container(
              width: 20,
              height: 20,
              color: Colors.red,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => _changeColor(Colors.red)
          ),
          ListTile(
            title: Text('남색'),
            leading: Container(
              width: 20,
              height: 20,
              color: Colors.indigo,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => _changeColor(Colors.indigo)
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text('어두운 테마'),
            subtitle: Text('빛 반사를 줄이고 야간 시청 환경 개선'),
            leading: Container(
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap:() => _changeBrightness(),
          ),
        ],
      ),
    );
  }
}