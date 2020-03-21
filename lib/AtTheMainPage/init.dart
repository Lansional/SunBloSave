import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:sunblosave/AtTheMainPage/drawer.dart';
import 'package:sunblosave/Board/CategoryPage/categoryPage.dart';
import 'package:sunblosave/Board/HomePage/homePage.dart';
import 'package:sunblosave/Board/NotificationPage/notification.dart';
import 'package:sunblosave/Board/StoragePage/storagePage.dart';

class InitPage extends StatefulWidget {
  InitPage({Key key}) : super(key: key);

  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> with TickerProviderStateMixin {
  StreamSubscription<ConnectivityResult> _subscription;

  var _listIndex = 0;
  List _pageList = [
    HomePage(),
    CategoryPage(),
    NotificationPage(),
    StoragePage()
  ];

  @override
  void initState() { 
    super.initState();

    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi) {
        Fluttertoast.showToast(msg: '와이파이 인터넷을 사용하고 있습니다.');
      } else if (result == ConnectivityResult.mobile) {
        Fluttertoast.showToast(msg: '데이터를 사용하고 계십니다.');
      } else {
        Fluttertoast.showToast(msg: '인터넷이 연결되어 있지 않습니다.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      body: _pageList[_listIndex],
      bottomNavigationBar: FancyBottomBar(
        items: [
          FancyItem(
            textColor: Colors.blue,
            title: 'Home',
            icon: Icon(Icons.home)
          ),
          FancyItem(
            textColor: Colors.green,
            title: 'Category',
            icon: Icon(Icons.category)
          ),
          FancyItem(
            textColor: Colors.red,
            title: 'Notification',
            icon: Icon(Icons.notifications)
          ),
          FancyItem(
            textColor: Colors.yellow,
            title: 'Library',
            icon: Icon(Icons.library_books)
          ),
        ],
        onItemSelected: (item) {
          setState(() {
            this._listIndex = item;
          });
        }
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.transparent,
      //   height: 90,
      //   child: Stack(
      //     children: <Widget>[
      //       Align(
      //         alignment: Alignment.bottomCenter,
      //         child: Container(
      //           height: 70,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(10),
      //         child: RaisedButton(
      //           child: Text('asdf'),
      //           color: Colors.green,
      //           onPressed: () {

      //           }
      //         ),
      //       )
      //     ],
      //   ),
      // )
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _listIndex,
      //   onTap: (index) {
      //     setState(() {
      //       this._listIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       activeIcon: Icon(GroovinMaterialIcons.home_account),
      //       title: Text('홈')
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.category),
      //       title: Text('카테고리')
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications_none),
      //       activeIcon: Icon(Icons.notifications),
      //       title: Text('알림')
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(GroovinMaterialIcons.library_books),
      //       activeIcon: Icon(Icons.local_library),
      //       title: Text('보관함')
      //     )
      //   ]
      // )
    );
  }


  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}