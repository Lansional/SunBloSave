import 'package:dynamic_theme/dynamic_theme.dart';
/**
 * write: Lansional
 * email: cbg1720@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:sunblosave/AtTheMainPage/init.dart';
import 'package:sunblosave/Routes/routes.dart';

void main() => runApp(MyApp());
 
// using material design
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: Colors.blue,                       // 테마변경
        brightness: brightness,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        )
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '선린블로그저장소',
          onGenerateRoute: onGenerateRoute,
          theme: theme,
          home: InitPage(),                                // 첫 페이지
          initialRoute: '/startPage',
        );
      },
    );
  }

}