import 'package:flutter/material.dart';
import 'package:sunblosave/Board/HomePage/tabsPage/recommendationPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _tabPages = <Widget>[
    Center(
      child: Text('구독'),
    ),
    RecommendationPage(),
    Center(
      child: Text('인기'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: _tabPages.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, bool) {
          return [
            SliverAppBar(
              centerTitle: true,
              floating: true,
              pinned: true,
              title: Text('선린블로그저장소'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                  },            // 입력시 실행할 페이지
                )
              ],
              bottom: TabBar(
                indicatorPadding: EdgeInsets.all(5),
                tabs: <Tab>[
                  Tab(text: '구독'),
                  Tab(text: '추천'),
                  Tab(text: '인기'),
                ]
              ),
            ),
          ];
        }, 
        body: TabBarView(
          children: _tabPages
        )
      )
    );
  }
}