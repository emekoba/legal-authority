import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Pages.dart';
import 'package:legal_authority/Pages/SideBar.dart';
import 'package:legal_authority/Widgets/Functional/SuperSearch.dart';
import 'package:legal_authority/Widgets/LetsTry/LetsTry.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:provider/provider.dart';

class LegalAuthority extends StatefulWidget {
  @override
  _LegalAuthorityState createState() => _LegalAuthorityState();
}

class _LegalAuthorityState extends State<LegalAuthority>
    with SingleTickerProviderStateMixin {
  final Duration _duration = Duration(milliseconds: 300);

  static AnimationController anime;
  static Animation<Offset> _slideLeft;
  static Animation<Offset> _slideUp;

  String _currentPageName;
  bool _letsTry = false;

  void _openSearch() {
    showSearch(context: context, delegate: SuperSearch());
  }

  @override
  void initState() {
    _currentPageName = "laws and docs";
    // _currentPageName = "forums";

    anime = AnimationController(vsync: this, duration: _duration);
    _slideLeft = Tween(begin: Offset(0.8, 0), end: Offset(0, 0)).animate(anime);
    _slideUp = Tween(begin: Offset(0, 5), end: Offset(0, 0)).animate(anime);

    super.initState();
  }

  @override
  void dispose() {
    anime.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    void _changePage(String name) {
      setState(() {
        anime.reverse();

        _currentPageName = name;

        mainBloc.closeSideBar();
      });
    }

    void _toggleSidebar() {
      setState(() {
        if (mainBloc.isSideBarOpen) {
          anime.reverse();
          mainBloc.closeSideBar();
        } else {
          anime.forward();
          mainBloc.openSideBar();
        }
      });
    }

    void
        _changePageFullTheatrics() {} //?..... for when transitioning from the dashboard...

    return WillPopScope(
        onWillPop: () async {
          _toggleSidebar();
          return false;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Stack(children: [
              SideBar(
                  duration: _duration,
                  slideLeft: _slideLeft,
                  slideUp: _slideUp,
                  changePage: _changePage,
                  openSearch: _openSearch,
                  currentPageName: _currentPageName),
              _letsTry
                  ? LetsTry()
                  : Pages(
                      duration: _duration, anime: anime, name: _currentPageName)
            ]))));
  }
}
