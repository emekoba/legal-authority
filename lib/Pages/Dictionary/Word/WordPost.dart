import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Dictionary/DictionaryBloc.dart';
import 'package:legal_authority/Pages/Dictionary/Word/WordPage.dart';
import 'package:provider/provider.dart';

class WordPost extends StatelessWidget {
  WordPost({this.word});

  final String word;

  @override
  Widget build(BuildContext context) {
    final DictionaryBloc dictionaryBloc = Provider.of<DictionaryBloc>(context);

    bool _inLibrary = dictionaryBloc.wordList[word]["isSavedToLibrary"] as bool;

    bool _inWorkstation =
        dictionaryBloc.wordList[word]["isSavedToWorkstation"] as bool;

    TextSpan _wordText = TextSpan(
        text: word,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    void _openWordPage() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) => WordPage(word: word)));
    }

    void _saveToLibrary() {
      dictionaryBloc.toggleSaveItem("library", word, _inLibrary);

      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
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

    void _saveToWorkStation() {
      dictionaryBloc.toggleSaveItem("workstation", word, _inWorkstation);

      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
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

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
            onTap: _openWordPage,
            child: Column(children: [
              Divider(height: 0),
              Row(children: [
                Expanded(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        alignment: Alignment.centerLeft,
                        constraints: BoxConstraints(minHeight: 80),
                        child: Text(word,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 21)))),
                // Row(children: [
                //   Tooltip(
                //       message: "save to workstation",
                //       preferBelow: false,
                //       margin: EdgeInsets.only(right: 30),
                //       child: GestureDetector(
                //           onTap: _saveToWorkStation,
                //           child: Container(
                //               height: 40,
                //               width: 40,
                //               child: Icon(
                //                   _inWorkstation
                //                       ? Icons.edit
                //                       : Icons.edit_outlined,
                //                   color: Theme.of(context).buttonColor,
                //                   size: 16)))),
                //   SizedBox(width: 10),
                //   Tooltip(
                //       message: "save to library",
                //       preferBelow: false,
                //       margin: EdgeInsets.only(right: 30),
                //       child: GestureDetector(
                //           onTap: _saveToLibrary,
                //           child: Container(
                //               height: 40,
                //               width: 40,
                //               child: Icon(
                //                   _inLibrary
                //                       ? Icons.bookmark_rounded
                //                       : Icons.bookmark_border_rounded,
                //                   color: Theme.of(context).buttonColor,
                //                   size: 16))))
                // ]),
                SizedBox(width: 15)
              ])
            ])));
  }
}
