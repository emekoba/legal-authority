import 'package:flutter/material.dart';

class BulletPointView extends StatefulWidget {
  @override
  _BulletPointViewState createState() => _BulletPointViewState();
}

class _BulletPointViewState extends State<BulletPointView> {
  List<Widget> _points = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Bullet Points"),
      ),
    );
  }
}
//todo:
