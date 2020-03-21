
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

FirebaseUser account;
class _DrawerPageState extends State<DrawerPage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/google_account_background.jpg'),
                fit: BoxFit.cover
              )
            ),
            currentAccountPicture: account == null ? null : CircleAvatar(
              backgroundImage: NetworkImage('${account.photoUrl}'),
            ),
            accountName: account == null ? Text('구글 계정을 로그인하세요') : Text('${account.displayName}'),
            accountEmail: account == null ? RaisedButton(
              child: Text('로그인'),
              onPressed: () {
                _handleSignIn()
                  .then((FirebaseUser user) {
                    account = user;
                  })
                  .catchError((e) => print('error: $e'));
                Navigator.pop(context);
              },
            ) : Text('${account.email}') 
          )
        ],
      ),
    );
  }
}