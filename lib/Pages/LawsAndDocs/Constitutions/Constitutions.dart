import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Widgets/Functional/LawBook.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Dumb/Flag.dart';

class Constitutions extends StatefulWidget {
  final String title;

  const Constitutions({this.title});

  @override
  _ConstitutionsState createState() => _ConstitutionsState();
}

class _ConstitutionsState extends State<Constitutions> {
  PageController _pageTab = PageController();

  Duration pageDuration = Duration(milliseconds: 200);

  Curve pageCurve = Curves.bounceIn;

  List<String> _tabs = [];

  List<Widget> _books = [];

  String _country = "Nigeria";

  String _currentTab = "1999";

  void _changeCountry() {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (ctx) {
        return CountryList();
      },
      // enableDrag: false,
      // isScrollControlled: true,
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentTab = _tabs[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final LawsAndDocsBloc lawsAndDocsBloc =
        Provider.of<LawsAndDocsBloc>(context);

    () {
      lawsAndDocsBloc.constitutions[_country]
          .forEach((String key, dynamic value) {
        _tabs.add(key);

        _books.add(LawBook.constitution(
            title: key, description: value["description"] as String));
      });
    }(); //? init_tabs

    bool _inLibrary = lawsAndDocsBloc.constitutions[_country][_currentTab]
        ["isSavedToLibrary"] as bool;

    bool _inWorkstation = lawsAndDocsBloc.constitutions[_country][_currentTab]
        ["isSavedToWorkstation"] as bool;

    TextSpan _titleText = TextSpan(
        text: "$_currentTab Constitution",
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    void _saveToLibrary(BuildContext context) {
      lawsAndDocsBloc.toggleSaveItem(
          saveTo: "library",
          lawGroup: "constitutions",
          tab: _currentTab,
          country: _country,
          currentSaveStateOfItem: _inLibrary);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: _inLibrary ? "removed   " : "saved   ",
                style: TextStyle(color: Colors.white)),
            _titleText,
            TextSpan(
                text: _inLibrary ? "   from library" : "   to library",
                style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    void _saveToWorkstation(BuildContext context) {
      lawsAndDocsBloc.toggleSaveItem(
          saveTo: "workstation",
          lawGroup: "constitutions",
          tab: _currentTab,
          country: _country,
          currentSaveStateOfItem: _inWorkstation);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: _inWorkstation ? "removed   " : "saved   ",
                style: TextStyle(color: Colors.white)),
            _titleText,
            TextSpan(
                text: _inWorkstation
                    ? "   from workstation"
                    : "   to workstation",
                style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    return Scaffold(
        // floatingActionButton: Padding(
        //     padding: EdgeInsets.only(right: 15, bottom: 15),
        //     child: InkWell(
        //         onTap: _changeCountry, child: Flag(country: "Nigeria"))),
        body: SafeArea(
            child: Column(children: [
      PageHeader(
          title: widget.title,
          icon: Icons.arrow_back,
          onLeadingIconTapped: () => Navigator.pop(context),
          titleStyle: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 20, color: Color(0xfff6f5f1)),
          endWidget: Row(children: [
            InkWell(
                onTap: () => _saveToWorkstation(context),
                child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                        _inWorkstation == true
                            ? Icons.edit
                            : Icons.edit_outlined,
                        size: 20,
                        color: Theme.of(context).buttonColor))),
            InkWell(
                onTap: () => _saveToLibrary(context),
                child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                        _inLibrary == true
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        size: 20,
                        color: Theme.of(context).buttonColor)))
          ])),
      Expanded(
          child: Container(
              color: Color(0xfff6f5f1),
              child: Row(children: [
                SideTabBar(
                    selectionBarColor: Theme.of(context).primaryColor,
                    fontColor: Theme.of(context).primaryColor,
                    uppercase: true,
                    side: "left",
                    control: _pageTab,
                    tabs: _tabs),
                Expanded(
                    child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (index) => _changePage(index),
                        itemCount: _tabs.length,
                        controller: _pageTab,
                        itemBuilder: (context, index) => _books[index]))
              ])))
    ])));
  }
}

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
