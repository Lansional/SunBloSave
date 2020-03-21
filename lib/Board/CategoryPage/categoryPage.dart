import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var _pages = [
    Center(
      child: Text('채널'),
    ),
    Center(
      child: Text('카테고리'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      initialIndex: 1,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: TabBar(
              indicatorPadding: EdgeInsets.all(5),
              tabs: <Widget>[
                Tab(text: '채널'),
                Tab(text: '카테고리')
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              children: _pages,
            ),
          )
        ],
      ),
    );
  }
}