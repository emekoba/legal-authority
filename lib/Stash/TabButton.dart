import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  final String name;
  final Function selectTab;
  PageController ctrl;
  final int type;

  TabButton({this.name, this.selectTab, this.ctrl, this.type});

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  bool isActive = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.selectTab(widget.name),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: isActive ? Theme.of(context).buttonColor : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Text(widget.name,
            style: TextStyle(
                fontSize: 11,
                fontFamily: "Sailor",
                color: isActive
                    ? Theme.of(context).iconTheme.color
                    : Colors.blue)),
      ),
    );
  }
}
