import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class Settings extends StatefulWidget {
  final Function openSidebar;

  Settings({this.openSidebar});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> _pages = [
    "dashboard",
    "laws and docs",
    "library",
    "dictionary",
    "workstation",
    "lectures",
    "forums",
    "ask an expert",
    "store",
    "settings",
    "notifications"
  ];

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    return Scaffold(
      body: Column(children: [
        PageHeader(
          title: "SETTINGS",
          icon: Icons.settings,
          onLeadingIconTapped: widget.openSidebar,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 10),
                  child: Text("Recently Visited Pages",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 20, color: Theme.of(context).accentColor))),
              Divider(),
            ])),
        Container(
            height: 600,
            child: ListView.builder(
                // itemExtent: _pages.length,
                padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_pages[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 17,
                                    // color: Colors.blueGrey,
                                    // color: Colors.amberAccent,
                                    color: Theme.of(context).accentColor,
                                    // color: Colors.grey,
                                  )),
                          Text("${mainBloc.pages[_pages[index]]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 17, color: Colors.amberAccent,
                                    // color: Theme.of(context).accentColor,
                                    // color: Colors.grey,
                                  ))
                        ]))))
      ]),
    );
  }
}

//? so that we dont call the server constantly to simply update as single value
//? we can set all to send once every month..abstract
//? also we need to create an errorBloc that registers all the errors on the
// ? users' apps...
//

//? change profile
//? change theme
//? change
