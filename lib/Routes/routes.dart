import 'package:flutter/material.dart';
import 'package:sunblosave/AtTheMainPage/searchPage.dart';

import 'package:sunblosave/Board/blogMake.dart';
import 'package:sunblosave/Setting/setting.dart';
import 'package:sunblosave/startPage.dart';
import 'package:sunblosave/showBlog.dart';

// 페이지 엘리베이터 기능
var routes = {
  '/searchPage': (context) => SearchPage(),
  '/settingPage': (context) => SettingPage(),         // 설정창

  '/startPage': (context) => StartPage(),               // 시작 페이지

  '/makeBlogPage': (context) => BlocMakePage(),       // 블로그 만드는 페이지
  '/showBlogPage': (context) => ShowBlogPage(),        // 블로그 보여주는 페이지
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
        return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};