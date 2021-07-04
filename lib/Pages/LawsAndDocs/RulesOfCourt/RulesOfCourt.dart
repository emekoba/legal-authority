import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Widgets/Functional/LawBook.dart';
import 'package:provider/provider.dart';

class RulesOfCourt extends StatefulWidget {
  final String title;

  const RulesOfCourt({this.title});

  @override
  _RulesOfCourtState createState() => _RulesOfCourtState();
}

class _RulesOfCourtState extends State<RulesOfCourt> {
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

      lawsAndDocsBloc.roc.forEach((dynamic key, dynamic value) {
        tab = key.toString();

        _sideTabBarNames.add(tab);

        // value.forEach((String key, dynamic value) {
        //   _states.add(CountryPost(title: key));
        // });

        // _tabs.add(LawList(
        //     tabName: tab, states: _states, closeSearchbar: _closeSearchbar));

        // _states = [];
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
                                                fontSize: 13,
                                                color: Colors.grey))))
                            : Text(widget.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 16,
                                        color: Theme.of(context).accentColor))
                      ])),
              SizedBox(height: 20),
              Expanded(
                  child: Row(children: [
                SideTabBar(
                  
                    uppercase: true,
                    side: "left",
                    control: _subPageTab,
                    tabs: _sideTabBarNames),
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
        child: StaggeredGridView.countBuilder(
            padding: EdgeInsets.only(right: 10),
            crossAxisCount: 4,
            itemCount: states.length,
            itemBuilder: (BuildContext context, int index) => states[index],
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 1.5 : 1),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4));
  }
}

class CountryPost extends StatelessWidget {
  final String title;

  const CountryPost({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  Card(
        //     color: Theme.of(context).primaryColor,
        //     elevation: 5,
        //     child:
        Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(children: [
              Divider(height: 0),
              Expanded(
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).buttonColor))),
                          child: Center(
                              child: Text(title ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontSize: 15)))))),
              Divider(height: 0),
            ]));
    // );
  }
}
