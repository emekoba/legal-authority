import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Widgets/Media/Reader/Reader.dart';
import 'package:provider/provider.dart';

class LawBook extends StatelessWidget {
  final String title;
  final String description;
  final String enacted;
  final String tabName;
  final Map tags;
  final Map content;
  String type;

  LawBook.act(
      {this.tabName,
      this.title,
      this.description,
      this.enacted,
      this.tags,
      this.content}) {
    type = "act";
  }

  LawBook.constitution(
      {this.tabName,
      this.title,
      this.description,
      this.enacted,
      this.tags,
      this.content}) {
    type = "constitution";
  }

  @override
  Widget build(BuildContext context) {
    void _openBook(String title, String description, String content) {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) => Reader(
                  title: type == "constitution" ? "$title Constitution" : title,
                  description: description,
                  content: content)));
    }

    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () => _openBook(title, description, "content"),
          child: type == "act"
              ? Act(
                  title: title,
                  description: description,
                  enacted: enacted,
                  tabName: tabName)
              : Constitution(title: title, description: description),
        ));
  }
}

class Act extends StatelessWidget {
  final String title;
  final String description;
  final String enacted;
  final Map<String, IconData> tagsList;
  final String tabName;
  final Function saveToLibrary;
  final Function saveToWorkStation;

  Act(
      {this.title,
      this.description,
      this.enacted,
      this.tabName,
      this.saveToLibrary,
      this.saveToWorkStation,
      this.tagsList});

  @override
  Widget build(BuildContext context) {
    final LawsAndDocsBloc lawsAndDocsBloc =
        Provider.of<LawsAndDocsBloc>(context);

    bool _inLibrary =
        lawsAndDocsBloc.aotf[tabName][title]["isSavedToLibrary"] as bool;

    bool _inWorkstation =
        lawsAndDocsBloc.aotf[tabName][title]["isSavedToWorkstation"] as bool;

    TextSpan _titleText = TextSpan(
        text: title,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    const Map<String, IconData> _tagsList = {
      // "company": Icons.backpack,
    };

    void _saveToLibrary() {
      lawsAndDocsBloc.toggleSaveItem(
          saveTo: "library",
          lawGroup: "aotf",
          tab: tabName,
          title: title,
          currentSaveStateOfItem: _inLibrary);

      Scaffold.of(context).showSnackBar(SnackBar(
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

    void _saveToWorkStation() {
      lawsAndDocsBloc.toggleSaveItem(
          saveTo: "workstation",
          lawGroup: "aotf",
          tab: tabName,
          title: title,
          currentSaveStateOfItem: _inLibrary);

      Scaffold.of(context).showSnackBar(SnackBar(
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

    return Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                    width: 5, color: Theme.of(context).buttonColor))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Divider(height: 0),
          Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              constraints: BoxConstraints(minHeight: 80),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${title}  (${enacted})",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 17, height: 1.5)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Wrap(
                            children: _tagsList.entries
                                .map((e) => Chip(
                                    backgroundColor:
                                        Theme.of(context).accentColor,
                                    label: Text(e.key,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontSize: 10))))
                                .toList())),
                    // Text(description,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .headline6
                    //         .copyWith(fontSize: 14, height: 1.4))
                  ])),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(width: 10),
            Tooltip(
                message: "save to library",
                preferBelow: false,
                margin: EdgeInsets.only(right: 30),
                child: InkWell(
                    onTap: _saveToLibrary,
                    child: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                            _inLibrary
                                ? Icons.bookmark_rounded
                                : Icons.bookmark_border_rounded,
                            color: Theme.of(context).buttonColor,
                            size: 16)))),
            SizedBox(width: 10),
          ]),
          // Divider(height: 0)
        ]));
  }
}

class Constitution extends StatelessWidget {
  final String title;
  final String description;
  final Function saveToLibrary;
  final Function saveToWorkStation;

  Constitution(
      {this.title,
      this.saveToLibrary,
      this.saveToWorkStation,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 40, 10, 10),
        child: Expanded(
            child: Column(children: [
          Expanded(
              child: Center(
                  child: Text("$title Constitution",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 50,
                          height: 1.8,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Theme.of(context).primaryColor)))),
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(description,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,
                      height: 2,
                      color: Theme.of(context).accentColor))),
          SizedBox(height: 50),
        ])));
  }
}

class BoxChip extends StatelessWidget {
  final Widget label;
  final Color backgroundColor;

  const BoxChip({Key key, this.label, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.only(right: 10),
            color: Theme.of(context).accentColor,
            child: label));
  }
}
