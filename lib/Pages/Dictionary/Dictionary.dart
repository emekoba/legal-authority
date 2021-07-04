import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Dictionary/DictionaryBloc.dart';
import 'package:legal_authority/Pages/Dictionary/Word/WordList.dart';
import 'package:legal_authority/Pages/Dictionary/Word/WordPage.dart';
import 'package:legal_authority/Pages/Dictionary/Word/WordPost.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Functional/SearchBox.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dictionary extends StatefulWidget {
  final Function openSidebar;

  const Dictionary({this.openSidebar});

  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  Map alphabets = <String, Map>{
    "A": <String, Map>{},
    "B": <String, Map>{},
    "C": <String, Map>{},
    "D": <String, Map>{},
    "E": <String, Map>{},
    "F": <String, Map>{},
    "G": <String, Map>{},
    "H": <String, Map>{},
    "I": <String, Map>{},
    "J": <String, Map>{},
    "K": <String, Map>{},
    "L": <String, Map>{},
    "M": <String, Map>{},
    "N": <String, Map>{},
    "O": <String, Map>{},
    "P": <String, Map>{},
    "Q": <String, Map>{},
    "R": <String, Map>{},
    "S": <String, Map>{},
    "T": <String, Map>{},
    "U": <String, Map>{},
    "V": <String, Map>{},
    "W": <String, Map>{},
    "X": <String, Map>{},
    "Y": <String, Map>{},
    "Z": <String, Map>{},
  };

  Map history = <String, Map>{};

  void _openSearch() {
    showModalBottomSheet<Widget>(
        backgroundColor: Theme.of(context).primaryColor,
        context: context,
        builder: (ctx) {
          return Container();
        });
  }

  void _goToHistoryPage() {}

  void _updateText() {}

  @override
  Widget build(BuildContext context) {
    final DictionaryBloc dictionaryBloc = Provider.of<DictionaryBloc>(context);

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    void _openSidebar() async {
      await _dismissInput();

      widget.openSidebar();
    }

    () {
      // the alphabets will be created by mapping through words and '
      // creating a list based on their alphabetical order by checking each
      // letter of the word...there shouldnt be an alphabets entry in the database
      // it chould be self generated...in here!
      //
      //
      //
      // dictionaryBloc.alphabets.forEach((dynamic key, dynamic value) {
      //   alphabets[key] = value;
      // });

      //? use bloc to initiaLIZE HISTORY...
    }(); //? _initAlphabetsAndHistory();

    return GestureDetector(
      onTap: _dismissInput,
      child: Scaffold(
          body: SafeArea(
              child: CustomScrollView(slivers: [
        PageHeader.sliver(
            title: "DICTIONARY",
            icon: FontAwesomeIcons.book,
            iconSize: 15,
            onLeadingIconTapped: _openSidebar),
        SliverList(
            delegate: SliverChildListDelegate([
          SearchBox(
              searchOntype: true,
              onSearchButtonTapped: _openSearch,
              onChanged: _updateText),
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(height: 20),
                ExpansionTile(
                    initiallyExpanded: true,
                    title: Text("Glossary",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 20,
                            fontFamily: "Sebino",
                            color: Theme.of(context).accentColor)),
                    childrenPadding: const EdgeInsets.all(20),
                    children: [
                      GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: alphabets.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20),
                          itemBuilder: (BuildContext context, int index) {
                            dynamic key = alphabets.keys.elementAt(index);

                            return LetterBtn(key.toString());
                          })
                    ]),
                SizedBox(height: 10),
                // dictionaryBloc.history.isNotEmpty
                //     ?
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  InkWell(
                      onTap: _goToHistoryPage,
                      child: Container(
                          padding: const EdgeInsets.only(left: 18, right: 20),
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Recent",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            fontSize: 20,
                                            fontFamily: "Sebino",
                                            color:
                                                Theme.of(context).accentColor)),
                                Icon(Icons.history_rounded,
                                    color: Theme.of(context).buttonColor)
                              ]))),
                  SizedBox(height: 20),
                  ...dictionaryBloc.history.map((e) => WordPost(word: e))
                ])
                // : Offstage()
              ]))
        ]))
      ]))),
    );
  }
}

class LetterBtn extends StatelessWidget {
  const LetterBtn(this.letter);

  final String letter;

  @override
  Widget build(BuildContext context) {
    void _openList() {
      Navigator.push(context,
          MaterialPageRoute<Widget>(builder: (context) => WordList(letter)));
    }

    return RawMaterialButton(
      onPressed: _openList,
      // fillColor: Theme.of(context).accentColor,
      shape: CircleBorder(),
      child: Text(letter.toLowerCase(),
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 25)),
    );
  }
}

class RecentBtn extends StatelessWidget {
  const RecentBtn(this.word);

  final String word;

  @override
  Widget build(BuildContext context) {
    void _openWordPage() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) => WordPage(word: word)));
    }

    return GestureDetector(
        onTap: _openWordPage,
        child: Container(
            constraints: BoxConstraints(minWidth: 15),
            margin: const EdgeInsets.only(left: 20, bottom: 5),
            height: 30,
            child: Text(word,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 13, letterSpacing: 1.5))));
  }
}
