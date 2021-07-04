import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Dictionary/Word/WordPage.dart';
import 'package:legal_authority/Widgets/Functional/Highlight.dart';
import 'package:legal_authority/Widgets/Media/Reader/Reader.dart';

class NoteView extends StatefulWidget {
  final Function closeFab;

  String caller;

  String type;

  NoteView({this.closeFab});

  NoteView.portion({this.closeFab}) {
    type = "portion";
  }
  //? get a particular portion of a book or article

  NoteView.lectures({this.closeFab}) {
    caller = "lectures";
  }

  NoteView.lawsAndDocs({this.closeFab}) {
    caller = "lawsAndDocs";
  }

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  List<Widget> _bookPages = [];

  String x =
      "The 1999 constitution restored democratic rule to Nigeria, and remains in force today. In January 2011, two amendments of the 1999 constitution were signed by President Olusegun Obasanjo, the first modifications since the document came into use in 1999.33. (1) Every person has a right as having been deprived of his life in contravention of this section, if he dies as a result of the use, to such extent and in such circumstances as are permitted by law, of such force as is reasonably necessary -(a) for the defence of any person from unlawful violence or for the defence of property:(b) in order to effect a lawful arrest or to prevent the escape of person(s) lawfully detained; or(c) for the purpose of suppressing a riot, insurrection or mutiny.34. (1) Every individual is entitled to respect for the dignity of his person, and accordingly -(a) no person shall be subject to torture or to inhuman or degrading treatment;(b) no person shall he held in slavery or servitude; and(c) no person shall be required to perform forced or compulsory labour.(2) for the purposes of subsection (1) (c) of this section, 'forced or compulsory labour' does not include -(a) any labour required in consequence of the sentence or order of a court;(b) any labour required of members of the armed forces of the Federation or the Nigeria Police Force in pursuance of their duties as such;(c) in the case of persons who have conscientious objections to service in the armed forces of the Federation, any labour required instead of such service;(d) any labour required which is reasonably necessary in the event of any emergency or calamity threatening the life or well-being of the community; or(e) any labour or service that forms part of -(i) normal communal or other civic obligations of the well-being of the community.(ii) such compulsory national service in the armed forces of the Federation as may be prescribed by an Act of the National Assembly, or(iii) such compulsory national service which forms part of the education and training of citizens of Nigeria as may be prescribed by an Act of the National Assembly.";

  bool _onScroll(dynamic t) {
    widget.closeFab();

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: NotificationListener(
            onNotification: (dynamic t) => _onScroll(t),
            child: Lecture(content: x)));
  }
}

class Lecture extends StatelessWidget {
  final String content;

  const Lecture({this.content});

  @override
  Widget build(BuildContext context) {
    String _largeTxt1 =
        "33. (1) Every person has a right as having been deprived of his life in contravention of this section, " +
            "if he dies as a result of the use, to such extent and in such circumstances as are permitted by law, of such force as is reasonably necessary -" +
            "(a) for the defence of any person from unlawful violence or for the defence of property:" +
            "(b) in order to effect a lawful arrest or to prevent the escape of person(s) lawfully detained; or" +
            "(c) for the purpose of suppressing a";

    String _largeTxt2 =
        "34. (1) Every individual is entitled to respect for the dignity of his person, and accordingly -" +
            "(a) no person shall be subject to torture or to inhuman or degrading treatment;" +
            "(b) no person shall he held in slavery or servitude; and" +
            "(c) no person shall be required to perform";

    String _largeTxt3 =
        "(2) for the purposes of subsection (1) (c) of this section,";

    String _largeTxt4 = "does not include -(a) any labour required in consequence of the sentence or order of a court;" +
        "(b) any labour required of members of the armed forces of the Federation or the Nigeria Police Force in pursuance of their duties as such;" +
        "(c) in the case of persons who have conscientious objections to service in the armed forces of the Federation, any labour required instead of such service;" +
        "(d) any labour required which is reasonably necessary in the event of any emergency or calamity threatening the life or well-being of the community; or" +
        "(e) any labour or service that forms part of -" +
        "(i) normal communal or other civic obligations of the well-being of the community." +
        "(ii) such compulsory national service in the armed forces of the Federation as may be prescribed by an Act of the National Assembly, or" +
        "(iii) such compulsory national service which forms part of the education and training of citizens of Nigeria as may be prescribed by an Act of the National Assembly.";

    bool highlight = true;

    _openModal({String type, String word}) {
      showModalBottomSheet<Widget>(
          context: context,
          builder: (context) {
            switch (type) {
              case "dictionary":
                return WordPage.concise(word: word);
                break;

              case "law":
                return Reader.portion(content: content);
                break;

              default:
                return null;
            }
          });
    }

    List<InlineSpan> _fullText = [
      TextSpan(text: "The"),
      Highlight(text: "1999 constitution", shouldHighlight: highlight)
          .link("law", _openModal),
      TextSpan(text: "restored"),
      Highlight(text: "democratic", shouldHighlight: highlight)
          .link("dictionary", _openModal),
      TextSpan(
          text:
              "rule to Nigeria and remains in force today. In January 2011, two amendments of the"),
      Highlight(text: "1999 constitution", shouldHighlight: highlight)
          .link("law", _openModal),
      TextSpan(
          text:
              "were signed by President Olusegun Obasanjo, the first modifications since the document came into use in 1999."),
      TextSpan(text: _largeTxt1),
      Highlight(text: "riot", shouldHighlight: highlight)
          .link("dictionary", _openModal),
      TextSpan(text: ","),
      Highlight(text: "insurrection", shouldHighlight: highlight)
          .link("dictionary", _openModal),
      TextSpan(text: "or"),
      Highlight(text: "mutiny", shouldHighlight: highlight)
          .link("dictionary", _openModal),
      TextSpan(text: _largeTxt2),
      Highlight(text: "forced or compulsory labour", shouldHighlight: highlight)
          .link("dictionary", _openModal),
      TextSpan(text: _largeTxt3),
      Highlight(text: "forced or compulsory labour", shouldHighlight: highlight)
          .link("dictionary", _openModal),
      TextSpan(text: _largeTxt4),
    ];

    return Container(
        child: ListView(children: [
      RichText(
          text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: 20, height: 3, letterSpacing: 2.5),
              children: _fullText)),
      SizedBox(height: 200)
    ]));
  }
}

class Constitution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
