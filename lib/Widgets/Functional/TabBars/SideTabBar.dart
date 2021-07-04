import 'package:flutter/material.dart';

enum sideTabBaraxis {
  horizontal,
  vertical,
}

enum selectionBarAlignment {
  left,
  right,
  top,
  botttom,
}

class SideTabBar extends StatefulWidget {
  const SideTabBar(
      {this.tabs,
      this.control,
      this.side,
      this.selectionBarAlignment,
      this.fontSize,
      this.axis,
      this.backgroundColor,
      this.alignment,
      this.fullBar = false,
      this.fontColor,
      this.selectionBarColor,
      this.uppercase});

  final List tabs;
  final PageController control;
  final String side;
  final String selectionBarAlignment;
  final double fontSize;
  final String axis;
  final Color fontColor;
  final bool uppercase;
  final Color selectionBarColor;
  final Color backgroundColor;
  final bool fullBar;

  final String alignment; // alignment will change whether it is "horizontal"
  // or "vertical"

  @override
  _SideTabBarState createState() => _SideTabBarState();
}

class _SideTabBarState extends State<SideTabBar> {
  Map<String, bool> _btns = {};

  Duration pageDuration = Duration(milliseconds: 200);

  Curve pageCurve = Curves.bounceIn;

  int _getIndexOf(String tabValue) {
    int x = 0;
    int index = 0;

    _btns.forEach((key, value) {
      if (key == tabValue) {
        index = x;
      }
      x = x + 1;
    });

    return index;
  }

  void _selectTab(String name) {
    setState(() {
      _btns.forEach((String key, dynamic value) {
        if (key != name) {
          _btns[key] = false;
        }
      });
      _btns[name] = true;
    });

    widget.control.jumpToPage(_getIndexOf(name));

    // widget.control.animateToPage(_getIndexOf(name),
    // duration: pageDuration, curve: pageCurve);
  }

  int _getSide() {
    switch (widget.side) {
      case "top":
        return 4;
        break;

      case "left":
        return 3;
        break;

      case "right":
        return 1;
        break;

      case "bottom":
        return 2;
        break;
      default:
        return 3;
    }
  }

  @override
  void initState() {
    int x = 0;

    setState(() {
      widget.tabs.forEach((dynamic e) {
        _btns[e.toString()] = x == 0 ? true : false;
        x++;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.axis == "vertical"
        ? Container(
            height: 50,
            color: widget.backgroundColor ?? Colors.transparent,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _btns.length,
                itemBuilder: (context, index) {
                  String key = _btns.keys.elementAt(index);

                  return Column(children: [
                    Offstage(
                        offstage: widget.selectionBarAlignment != "top",
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: 40,
                            height: _btns[key] == true ? 4 : 0,
                            color: _btns[key] == true
                                ? widget.selectionBarColor ??
                                    Theme.of(context).buttonColor
                                : widget.backgroundColor ??
                                    Theme.of(context).primaryColor)),
                    Expanded(
                        child: InkWell(
                            onTap: () => _selectTab(key),
                            child: Container(
                                // constraints: BoxConstraints(minHeight: 80),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                    child: Text(
                                        widget.uppercase == true
                                            ? key.toUpperCase()
                                            : key,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            .copyWith(
                                                color: widget.fontColor ??
                                                    Theme.of(context)
                                                        .buttonColor,
                                                letterSpacing: 1.8,
                                                fontSize:
                                                    widget.fontSize == null
                                                        ? 9
                                                        : widget.fontSize)))))),
                    Offstage(
                        offstage: widget.selectionBarAlignment != "top" ||
                            widget.selectionBarAlignment != null,
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: 40,
                            height: _btns[key] == true ? 4 : 0,
                            color: _btns[key] == true
                                ? widget.selectionBarColor ??
                                    Theme.of(context).buttonColor
                                : Colors.transparent ??
                                    Theme.of(context).primaryColor))
                  ]);
                }))
        : Container(
            width: 50,
            color: widget.backgroundColor ?? Colors.transparent,
            child: ListView.builder(
                itemCount: _btns.length,
                itemBuilder: (context, index) {
                  String key = _btns.keys.elementAt(index);

                  if (widget.fullBar) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: _btns[key] == true ? 4 : 0,
                                    color: _btns[key] == true
                                        ? widget.selectionBarColor ??
                                            Theme.of(context).buttonColor
                                        : Colors.transparent ??
                                            Theme.of(context).primaryColor))),
                        child: InkWell(
                            onTap: () => _selectTab(key),
                            child: Container(
                                constraints: BoxConstraints(minHeight: 80),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Center(
                                    child: RotatedBox(
                                        quarterTurns: _getSide(),
                                        child: Text(widget.uppercase == true ? key.toUpperCase() : key,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3
                                                .copyWith(
                                                    color: widget.fontColor ??
                                                        Theme.of(context)
                                                            .buttonColor,
                                                    letterSpacing: 1.8,
                                                    fontSize: widget.fontSize == null
                                                        ? 14
                                                        : widget.fontSize)))))));
                  }

                  return Row(children: [
                    Offstage(
                        offstage: widget.selectionBarAlignment != "left",
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            height: 40,
                            width: _btns[key] == true ? 4 : 0,
                            color: _btns[key] == true
                                ? widget.selectionBarColor ??
                                    Theme.of(context).buttonColor
                                : widget.backgroundColor ??
                                    Theme.of(context).primaryColor)),
                    Expanded(
                        child: InkWell(
                            onTap: () => _selectTab(key),
                            child: Container(
                                constraints: BoxConstraints(minHeight: 80),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Center(
                                    child: RotatedBox(
                                        quarterTurns: _getSide(),
                                        child: Text(
                                            widget.uppercase == true
                                                ? key.toUpperCase()
                                                : key,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3
                                                .copyWith(
                                                    color: widget.fontColor ??
                                                        Theme.of(context)
                                                            .buttonColor,
                                                    letterSpacing: 1.8,
                                                    fontSize: widget.fontSize ==
                                                            null
                                                        ? 14
                                                        : widget.fontSize))))))),
                    Offstage(
                        offstage: widget.selectionBarAlignment == "right" ||
                            widget.selectionBarAlignment != null,
                        child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            height: 40,
                            width: _btns[key] == true ? 4 : 0,
                            color: _btns[key] == true
                                ? widget.selectionBarColor ??
                                    Theme.of(context).buttonColor
                                : widget.backgroundColor ??
                                    Theme.of(context).primaryColor))
                  ]);
                }));
  }
}
