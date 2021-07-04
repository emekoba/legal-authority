import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Dashboard/Dashboard.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocs.dart';
import 'package:legal_authority/Pages/AskAnExpert/AskAnExpert.dart';
import 'package:legal_authority/Pages/Dictionary/Dictionary.dart';
import 'package:legal_authority/Pages/Forums/Forums.dart';
import 'package:legal_authority/Pages/Lectures/Lectures.dart';
import 'package:legal_authority/Pages/Library/Library.dart';
import 'package:legal_authority/Pages/Notifications/Notifications.dart';
import 'package:legal_authority/Pages/Settings/Settings.dart';
import 'package:legal_authority/Pages/Store/Store.dart';
import 'package:legal_authority/Pages/WorkStation/WorkStation.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/mainBloc.dart';

class Pages extends StatefulWidget {
  Pages({
    this.isSideBarOpen,
    this.duration,
    this.anime,
    this.name,
  });

  bool isSideBarOpen;
  final Duration duration;
  final AnimationController anime;
  final String name;

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  String _pageEntered = "dashboard";

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    double width = MediaQuery.of(context).size.width;

    double _left = mainBloc.isSideBarOpen ? 0.30 * width : 0;

    double _right = mainBloc.isSideBarOpen ? -0.4 * width : 0;

    void _openSidebar() {
      setState(() {
        widget.anime.forward();
        mainBloc.openSideBar();
      });
    }

    Widget _getPage() {
      if (_pageEntered != widget.name) {
        mainBloc.onPageEntered(pageName: widget.name);

        setState(() => _pageEntered = widget.name);
      }

      switch (widget.name) {
        case "dashboard":
          return Dashboard(openSidebar: _openSidebar);
          break;
        case "laws and docs":
          return LawsAndDocs(openSidebar: _openSidebar);
          break;
        case "library":
          return Library(openSidebar: _openSidebar);
          break;
        case "dictionary":
          return Dictionary(openSidebar: _openSidebar);
          break;
        case "lectures":
          return Lectures(openSidebar: _openSidebar);
          break;
        case "workstation":
          return WorkStation(openSidebar: _openSidebar);
          break;
        case "ask an expert":
          return AskAnExpert(openSidebar: _openSidebar);
          break;
        case "forums":
          return Forums(openSidebar: _openSidebar);
          break;
        case "store":
          return Store(openSidebar: _openSidebar);
          break;
        case "notifications":
          return Notifications(openSidebar: _openSidebar);
          break;
        case "settings":
          return Settings(openSidebar: _openSidebar);
          break;
      }

      return null;
    }

    return AnimatedPositioned(
        top: 0,
        bottom: 0,
        left: _left,
        right: _right,
        duration: widget.duration,
        child: ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 0.6).animate(widget.anime),
            child: Material(
                // animationDuration: widget.duration,
                elevation: 20,
                color: Theme.of(context).primaryColor,
                borderRadius:
                    BorderRadius.circular(mainBloc.isSideBarOpen ? 20 : 0),
                child: Stack(children: [
                  _getPage(),
                  Container(
                      height: mainBloc.isSideBarOpen ? double.infinity : 0,
                      child: GestureDetector(
                          onTap: () => setState(() {
                                mainBloc.closeSideBar();
                                widget.anime.reverse();
                              })))
                ]))));
  }
}
