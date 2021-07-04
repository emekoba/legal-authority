import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Widgets/Functional/LawBook.dart';
import 'package:provider/provider.dart';

class LawsOfTheVariousStates extends StatefulWidget {
  final String title;

  const LawsOfTheVariousStates({this.title});

  @override
  _LawsOfTheVariousStatesState createState() => _LawsOfTheVariousStatesState();
}

class _LawsOfTheVariousStatesState extends State<LawsOfTheVariousStates> {
  PageController _pageTab = PageController();

  PageController _subPageTab = PageController();

  Duration pageDuration = Duration(milliseconds: 200);

  Curve pageCurve = Curves.bounceIn;

  List<Widget> _tabs = [];

  List<String> _sideTabBarNames = [];

  bool _searchOpened = false;

  void _openSearchbar() {
    setState(() => _searchOpened = true);
  }

  void _closeSearchbar() {
    if (_searchOpened) {
      setState(() => _searchOpened = false);
    }
  }

  void _textChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    final LawsAndDocsBloc lawsAndDocsBloc =
        Provider.of<LawsAndDocsBloc>(context);

    void _goBack() async {
      setState(() => _searchOpened = false);

      Navigator.pop(context);
    }

    () {
      String tab;

      List<Widget> _states = [];

      lawsAndDocsBloc.lotvs.forEach((dynamic key, dynamic value) {
        tab = key.toString();

        _sideTabBarNames.add(tab);

        value.forEach((String key, dynamic value) {
          _states.add(StatePost(title: key));
        });

        _tabs.add(LawList(
            tabName: tab, states: _states, closeSearchbar: _closeSearchbar));

        _states = [];
      });
    }(); //? _init_tabs

    return GestureDetector(
        onTap: _closeSearchbar,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: Offstage(
                offstage: _searchOpened,
                child: Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 20),
                    child: FloatingActionButton(
                        backgroundColor: Theme.of(context).buttonColor,
                        child: Icon(Icons.search,
                            color: Theme.of(context).iconTheme.color),
                        onPressed: _openSearchbar))),
            body: SafeArea(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                            shape: CircleBorder(),
                            color: Theme.of(context).buttonColor,
                            onPressed: _goBack,
                            child: Icon(Icons.arrow_back,
                                size: 15,
                                color: Theme.of(context).iconTheme.color)),
                        _searchOpened
                            ? Expanded(
                                child: TextField(
                                    autofocus: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 18, letterSpacing: 1),
                                    onChanged: (String value) =>
                                        _textChanged(value),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "search..",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                fontSize: 17,
                                                color: Colors.grey))))
                            : Text(widget.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 20,
                                        color: Theme.of(context).accentColor))
                      ])),
              SizedBox(height: 20),
              Expanded(
                  child: Row(children: [
                Column(children: [
                  Expanded(
                      flex: 2,
                      child: SideTabBar(
                          fontColor: Theme.of(context).accentColor,
                          uppercase: true,
                          side: "left",
                          control: _pageTab,
                          tabs: _sideTabBarNames)),
                  Container(
                      height: 280,
                      child: SideTabBar(
                          // fontColor: Theme.of(context).accentColor,
                          uppercase: true,
                          side: "left",
                          control: _subPageTab,
                          tabs: <String>["local laws", "state laws"]))
                ]),
                Expanded(
                    child: PageView.builder(
                        itemCount: _tabs.length,
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageTab,
                        itemBuilder: (ctxt, pos) => _tabs[pos]))
              ]))
            ]))));
  }
}

class LawList extends StatelessWidget {
  final String tabName;
  final List<Widget> states;
  final Function closeSearchbar;

  LawList({this.tabName, this.states, this.closeSearchbar});

  @override
  Widget build(BuildContext context) {
    bool _onScroll(dynamic t) {
      FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }

      closeSearchbar();

      return false;
    }

    return NotificationListener(
        onNotification: (dynamic t) => _onScroll(t),
        child: GridView.builder(
            padding: EdgeInsets.fromLTRB(20, 0, 15, 30),
            primary: false,
            shrinkWrap: true,
            itemCount: states.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) => states[index]));
  }
}

class StatePost extends StatelessWidget {
  final String title;

  const StatePost({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 1, color: Theme.of(context).accentColor)),
            child: Center(
                child: Text(title ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15)))));
  }
}
