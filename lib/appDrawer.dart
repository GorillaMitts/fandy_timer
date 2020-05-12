import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new Container(
            height: 50.0,
          ),
          new Center(
            child: new Image.asset('assets/fandysoft.png',
              width: 150.0,
              //height: 0.0,
              //color: Colors.black,
            ),
          ),
          new Expanded(
            child: new Container(
              width: 200.0,
              child: new Center(
                  child: new Text('This App was made for Kevin, who broke his arm walking the dog!',
                  textAlign: TextAlign.center,
                  ),
              ),
            ),
          ),
          new Container(
            child: new Text('This app was made with Flutter'),
          ),
          new Container(
            child: new Image.asset('assets/flutter.png',
            height: 50.0,
            ),
          ),
          new Container(
            height: 100.0,
            child: new Center(
              child: new Text('Special Thanks to Matt Carroll @ Fluttery',
              ),
            ),
          ),
          new Container(
            height: 150.0,
            child: new Center(
                child: new Text('© 2018 FanDy Soft LLC'
                ),
            ),
          ),
        ],
      ),
    );
  }
}
