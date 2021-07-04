import 'package:flutter/material.dart';

class TryTopTabBar extends StatefulWidget {
  TryTopTabBar({this.tabs, this.control, this.currentIndex});

  final List tabs;
  final PageController control;
  int currentIndex;

  @override
  _TryTopTabBarState createState() => _TryTopTabBarState();
}

class _TryTopTabBarState extends State<TryTopTabBar> {
  Map<String, bool> _stringTabs = {};

  void _selectTab(String name) {
    setState(() {
      _stringTabs.forEach((key, value) {
        if (key != name) {
          _stringTabs[key] = false;
        }
      });
      _stringTabs[name] = true;
    });

    widget.control.jumpToPage(_getIndexOf(name));
  }

  int _getIndexOf(String tabValue) {
    int x = 0;
    int index = 0;

    _stringTabs.forEach((key, value) {
      if (key == tabValue) {
        index = x;
      }
      x = x + 1;
    });

    return index;
  }

  @override
  void initState() {
    super.initState();

    int x = 0;

    setState(() {
      widget.tabs.forEach((dynamic e) {
        _stringTabs[e.toString()] = x == 0 ? true : false;
        x++;
      });
    });

    print(widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        height: 40,
        decoration: BoxDecoration(
            color: Color(0xff35354F),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Row(
            children: _stringTabs.entries
                .map((e) => Bar(e.key, e.value, _selectTab))
                .toList()));
  }
}

class Bar extends StatelessWidget {
  Bar(this.value, this.active, this.selectTab);

  final String value;
  final bool active;
  final Function selectTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () => selectTab(value),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: active
                        ? Theme.of(context).buttonColor
                        : Colors.transparent,
                    border: active ? Border.all(width: 2.5) : null,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                    child: Text(value,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 14,
                            color: active ? Colors.black : Colors.white))))));
  }
}
