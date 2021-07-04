import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Widgets/Functional/LawBook.dart';
import 'package:provider/provider.dart';

class ActsOfTheFederation extends StatefulWidget {
  final String title;

  const ActsOfTheFederation({this.title});

  @override
  _ActsOfTheFederationState createState() => _ActsOfTheFederationState();
}

class _ActsOfTheFederationState extends State<ActsOfTheFederation> {
  PageController _pageTab = PageController();

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
      Map content;

      List<Widget> books = [];

      lawsAndDocsBloc.aotf.forEach((dynamic key, dynamic value) {
        tab = key.toString();

        _sideTabBarNames.add(tab);

        value.forEach((String key, dynamic value) {
          content = value["content"] as Map;

          books.add(LawBook.act(
              tabName: tab,
              title: key,
              description: value["description"].toString(),
              enacted: value["enacted"].toString(),
              content: content));
        });

        _tabs.add(LawList(
            tabName: tab, books: books, closeSearchbar: _closeSearchbar));
        books = [];
      });
    }(); //? _init_tabs

    return GestureDetector(
        onTap: _closeSearchbar,
        child: Scaffold(
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
                SideTabBar(
                    // fontColor: Theme.of(context).accentColor,
                    side: "left",
                    control: _pageTab,
                    uppercase: true,
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
  final List<Widget> books;
  final Function closeSearchbar;

  LawList({this.tabName, this.books, this.closeSearchbar});

  ScrollController _scrollControl = ScrollController();

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
        child: ListView.builder(
            controller: _scrollControl,
            padding: EdgeInsets.only(bottom: 200),
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) => books[index]));
  }
}
