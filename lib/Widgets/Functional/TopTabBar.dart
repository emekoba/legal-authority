import 'package:flutter/material.dart';

class TopTabBar extends StatefulWidget {
  TopTabBar(
      {this.flexException,
      this.tabs,
      this.changeTab,
      this.control,
      this.currentIndex});

  TopTabBar.icon(
      {this.flexException,
      this.tabs,
      this.changeTab,
      this.control,
      this.currentIndex}) {
    isIcon = true;
  }

  int currentIndex;
  bool isIcon = false;
  bool flexException = false;
  List tabs;
  Function changeTab;
  final PageController control;

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  Map<String, bool> _tabs = {};
  bool flex = false;

  void _selectTab(String name) {
    setState(() {
      _tabs.forEach((key, value) {
        if (key != name) {
          _tabs[key] = false;
        }
      });
      _tabs[name] = true;
    });

    widget.changeTab(name);
  }

  @override
  void initState() {
    super.initState();

    int x = 0;

    setState(() {
      if (widget.tabs.length > 4 && !widget.isIcon) {
        flex = true;
      }

      // widget.tabs.forEach((dynamic e) {
      //   _tabs[e] = x == 0 ? true : false;
      //   x++;
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        height: 35,
        decoration: BoxDecoration(
            color: Color(0xff35354F),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: flex == true
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: _tabs.entries
                        .map((e) => Bar(flex, e.key, e.value, _selectTab))
                        .toList()))
            : Row(
                children: _tabs.entries
                    .map((e) => Bar(flex, e.key, e.value, _selectTab))
                    .toList()));
  }
}

class Bar extends StatelessWidget {
  Bar(this.flex, this.value, this.active, this.selectTab);

  Bar.icon(this.isIcon, this.flex, this.value, this.active, this.selectTab) {
    isIcon == true;
  }

  bool isIcon = false;
  final bool flex;
  final String value;
  final bool active;
  final Function selectTab;

  @override
  Widget build(BuildContext context) {
    return flex != true
        ? Expanded(
            child: GestureDetector(
                onTap: () => selectTab(value),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: active
                            ? Theme.of(context).buttonColor
                            : Colors.transparent,
                        border: active ? Border.all(width: 2.5) : null,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Center(child: Container()
                        // isIcon
                        // ? Icon(value,
                        //     color: active ? Colors.black : Colors.white30)
                        // : Text(value,
                        //     style: Theme.of(context).textTheme.headline2.copyWith(
                        //         fontSize: 10,
                        //         color: active
                        //             ? Colors.black
                        //             : Colors.white))
                        ))))
        : GestureDetector(
            onTap: () => selectTab(value),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                constraints: BoxConstraints(minWidth: 150),
                decoration: BoxDecoration(
                    color: active
                        ? Theme.of(context).buttonColor
                        : Colors.transparent,
                    border: active ? Border.all(width: 2.5) : null,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(child: Container()
                    // isIcon
                    //     ? Icon(value)
                    //     : Text(value, style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 9, color: active ? Colors.black : Colors.white))
                    )));
  }
}
