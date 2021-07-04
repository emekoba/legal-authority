import 'package:flutter/material.dart';

class SmallFab extends StatelessWidget {
  final IconData icon;
  final Function func;
  final String tip;

  const SmallFab({Key key, this.icon, this.func, this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.bounceInOut,
        duration: Duration(seconds: 3),
        child: Column(children: [
          Tooltip(
              message: tip,
              preferBelow: false,
              margin: EdgeInsets.only(right: 40),
              child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () => func(),
                  mini: true,
                  child: Icon(icon,
                      size: 20, color: Theme.of(context).iconTheme.color),
                  backgroundColor: Theme.of(context).buttonColor)),
          SizedBox(height: 10)
        ]));
  }
}
//todo: get bounce widget from pub...for bouncing on mount..
