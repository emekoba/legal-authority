import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Dictionary/DictionaryBloc.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:provider/provider.dart';

class WordPage extends StatefulWidget {
  final String word;

  bool isConcise = false;

  //? Full will get the word and search resources for all the info..
  //? pronounciation, synonyms etc..

  WordPage({this.word});

  WordPage.concise({this.word}) {
    isConcise = true;
  }

  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  List<String> _tabs = [
    "DEFINITIONS",
    "ABBREVIATIONS",
    "USAGE",
    "SYNONYMS",
    "ANTONYMS",
    "REFERENCES"
  ];

  bool _stopWidgetRefresh = false;

  @override
  void initState() {
    setState(() {
      _stopWidgetRefresh = true;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DictionaryBloc dictionaryBloc = Provider.of<DictionaryBloc>(context);

    () {
      if (dictionaryBloc.history.length <= 5 || _stopWidgetRefresh == false) {
        dictionaryBloc.addWordToHistory(widget.word);
      }
    }(); //? save word to recent list.....

    bool _inLibrary =
        dictionaryBloc.wordList[widget.word]["isSavedToLibrary"] as bool;

    bool _inWorkstation =
        dictionaryBloc.wordList[widget.word]["isSavedToWorkstation"] as bool;

    TextSpan _wordText = TextSpan(
        text: widget.word,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    void _pronounce() {}

    void _saveToLibrary() {
      dictionaryBloc.toggleSaveItem("library", widget.word, _inLibrary);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: _inLibrary ? "removed   " : "saved   ",
                style: TextStyle(color: Colors.white)),
            _wordText,
            TextSpan(
                text: _inLibrary ? "   from library" : "   to library",
                style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    void _saveToWorkstation() {
      dictionaryBloc.toggleSaveItem("workstation", widget.word, _inWorkstation);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: _inWorkstation ? "removed   " : "saved   ",
                style: TextStyle(color: Colors.white)),
            _wordText,
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
        body: widget.isConcise
            ? Concise(
                word: widget.word,
                tabs: _tabs,
                inLibrary: _inLibrary,
                inWorkstation: _inWorkstation,
                saveToLibrary: _saveToLibrary,
                saveToWorkstation: _saveToWorkstation,
                pronounce: _pronounce,
              )
            : Full(
                word: widget.word,
                tabs: _tabs,
                inLibrary: _inLibrary,
                inWorkstation: _inWorkstation,
                saveToLibrary: _saveToLibrary,
                saveToWorkstation: _saveToWorkstation,
                pronounce: _pronounce,
              ));
  }
}

class Full extends StatelessWidget {
  final String word;
  final List<String> tabs;
  bool inLibrary;
  bool inWorkstation;
  final Function saveToWorkstation;
  final Function saveToLibrary;
  final Function pronounce;

  Full(
      {this.word,
      this.tabs,
      this.inLibrary,
      this.inWorkstation,
      this.saveToWorkstation,
      this.saveToLibrary,
      this.pronounce});

  PageController _pageTab = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Decoration _headerDecoration = BoxDecoration(
        // color: Colors.grey.withOpacity(0.45),
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(5)));

    TextStyle _headerTextStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 7);

    void _openSettings() {
      showModalBottomSheet<Widget>(
        context: context,
        builder: (_) => Settings(),
        enableDrag: false,
        // isScrollControlled: true, //? full paged modal...
      );
    }

    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
          width: double.infinity,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 20),
          child: RaisedButton(
              shape: CircleBorder(),
              color: Theme.of(context).buttonColor,
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back,
                  size: 15, color: Theme.of(context).iconTheme.color))),
      Container(
          constraints: BoxConstraints(minHeight: 200),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Center(
                  child: Column(children: [
                Text(word,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 35)),
                SizedBox(height: 50),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => pronounce(),
                          child: Container(
                              height: 65,
                              width: 65,
                              decoration: _headerDecoration,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.volume_down_rounded,
                                        size: 22,
                                        color: Theme.of(context).buttonColor),
                                    SizedBox(height: 8),
                                    Text("PRONOUNCE", style: _headerTextStyle)
                                  ]))),
                      GestureDetector(
                          onTap: () => saveToWorkstation(),
                          child: Container(
                              height: 65,
                              width: 65,
                              decoration: _headerDecoration,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                        inWorkstation
                                            ? Icons.edit
                                            : Icons.edit_outlined,
                                        size: 22,
                                        color: Theme.of(context).buttonColor),
                                    SizedBox(height: 8),
                                    Text("WORKSTATION", style: _headerTextStyle)
                                  ]))),
                      GestureDetector(
                          onTap: () => saveToLibrary(),
                          child: Container(
                              height: 65,
                              width: 65,
                              decoration: _headerDecoration,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                        inLibrary
                                            ? Icons.bookmark
                                            : Icons.bookmark_border_rounded,
                                        size: 22,
                                        color: Theme.of(context).buttonColor),
                                    SizedBox(height: 8),
                                    Text("LIBRARY", style: _headerTextStyle)
                                  ]))),
                      GestureDetector(
                          onTap: _openSettings,
                          child: Container(
                              height: 65,
                              width: 65,
                              decoration: _headerDecoration,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.settings,
                                        size: 22,
                                        color: Theme.of(context).buttonColor),
                                    SizedBox(height: 8),
                                    Text("SETTINGS", style: _headerTextStyle)
                                  ])))
                    ])
              ])))),
      Expanded(
          child: Row(children: [
        SideTabBar(
            fontColor: Theme.of(context).accentColor,
            control: _pageTab,
            tabs: tabs),
        Expanded(
            child: PageView.builder(
                itemCount: tabs.length,
                physics: NeverScrollableScrollPhysics(),
                controller: _pageTab,
                itemBuilder: (ctxt, pos) {
                  return TabCategory(content: tabs[pos]);
                }))
      ]))
    ])));
  }
}

class Concise extends StatelessWidget {
  final String word;
  final List<String> tabs;
  bool inLibrary;
  bool inWorkstation;
  final Function saveToWorkstation;
  final Function saveToLibrary;
  final Function pronounce;

  Concise(
      {this.word,
      this.tabs,
      this.inLibrary,
      this.inWorkstation,
      this.saveToWorkstation,
      this.saveToLibrary,
      this.pronounce});

  @override
  Widget build(BuildContext context) {
    PageController _pageTab = PageController(initialPage: 0);

    return Scaffold(
        body: Row(children: [
      SideTabBar(
          fontSize: 12,
          fontColor: Theme.of(context).accentColor,
          control: _pageTab,
          tabs: tabs),
      Expanded(
          child: Column(children: [
        Container(
            padding: EdgeInsets.fromLTRB(10, 15, 5, 15),
            constraints: BoxConstraints(minHeight: 80),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(
                          child: Text(word,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontSize: 20)))),
                  Row(children: [
                    InkWell(
                        onTap: () => saveToWorkstation(),
                        child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                                inWorkstation
                                    ? Icons.edit
                                    : Icons.edit_outlined,
                                color: Theme.of(context).buttonColor,
                                size: 16))),
                    InkWell(
                        onTap: () => saveToLibrary(),
                        child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                                inLibrary
                                    ? Icons.bookmark_rounded
                                    : Icons.bookmark_border_rounded,
                                color: Theme.of(context).buttonColor,
                                size: 16)))
                  ])
                ])),
        Expanded(
          child: PageView.builder(
              itemCount: tabs.length,
              physics: NeverScrollableScrollPhysics(),
              controller: _pageTab,
              itemBuilder: (ctxt, pos) {
                return TabCategory(content: tabs[pos]);
              }),
        )
      ]))
    ]));
  }
}

class TabCategory extends StatelessWidget {
  final String content;

  const TabCategory({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
          child: Text(content ?? "",
              style: TextStyle(fontSize: 12, color: Colors.white))),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).primaryColor);
  }
}
