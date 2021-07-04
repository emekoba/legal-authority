import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Dictionary/DictionaryBloc.dart';
import 'package:legal_authority/Pages/Dictionary/Word/WordPost.dart';
import 'package:provider/provider.dart';

class WordList extends StatelessWidget {
  final String letter;

  const WordList(this.letter);

  @override
  Widget build(BuildContext context) {
    final DictionaryBloc dictionaryBloc = Provider.of<DictionaryBloc>(context);

    List<Widget> wordList = [];

    void _initWords() {
      dictionaryBloc.wordList.forEach((dynamic key, dynamic value) {
        wordList.add(WordPost(word: key.toString()));
      });
    }

    _initWords();

    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: RaisedButton(
                color: Theme.of(context).buttonColor,
                shape: CircleBorder(),
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back,
                    size: 15, color: Theme.of(context).iconTheme.color))),
        Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text("${letter.toUpperCase()} ${letter.toLowerCase()}",
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 25, color: Theme.of(context).accentColor)))
      ])),
      Expanded(
          child: ListView.builder(
              itemCount: wordList.length,
              itemBuilder: (BuildContext context, int index) =>
                  wordList[index]))
    ])));
  }
}
