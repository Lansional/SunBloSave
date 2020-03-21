import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendationPage extends StatefulWidget {
  RecommendationPage({Key key}) : super(key: key);

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  _refreshRecommendation() async {                  // GET
    await Future.delayed(Duration(seconds: 3), () {

    }).then((_) => print('done'));
  }
  @override
  Widget build(BuildContext context) {
    // 추천 페이지
    return SmartRefresher(
      controller: RefreshController(initialRefresh: false),           // if to releate change to "true"
      header: WaterDropHeader(),
      onRefresh: () => _refreshRecommendation(),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 30,
              child: Placeholder(),
            ),
            title: Text('${index + 1}'),
          );
        }
      ),
    );
  }
}