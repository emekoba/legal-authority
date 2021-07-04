import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Style/BookCover.dart';

class LegalDrafting extends StatefulWidget {
  final String title;

  const LegalDrafting({Key key, this.title}) : super(key: key);

  @override
  _LegalDraftingState createState() => _LegalDraftingState();
}

class _LegalDraftingState extends State<LegalDrafting> {
  @override
  Widget build(BuildContext context) {
    List<BookCover> books = [];

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
