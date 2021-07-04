import 'package:flutter/material.dart';
import 'package:legal_authority/Resources/Resources.dart';
import 'package:legal_authority/Widgets/Style/BookCover.dart';

class PrinciplesAndCases extends StatefulWidget {
  final String title;

  const PrinciplesAndCases({Key key, this.title}) : super(key: key);

  @override
  _PrinciplesAndCasesState createState() => _PrinciplesAndCasesState();
}

class _PrinciplesAndCasesState extends State<PrinciplesAndCases> {
  //https://www.law.ox.ac.uk/legal-research-and-mooting-skills-programme/legislation#:~:text=A%20typical%20modern%20Public%20General,information%20about%20repeals%20and%20amendments
  // this link should be an example of what will be used in this page..

  @override
  Widget build(BuildContext context) {
    List<Widget> books = [Text("get wikipedia articles as well")];

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
                title: Text(widget.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                elevation: 0,
                floating: true,
                actions: [
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.search_rounded))
                ]),
            SliverPadding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                sliver: SliverList(delegate: SliverChildListDelegate(books)))
          ]),
        ));
  }
}
