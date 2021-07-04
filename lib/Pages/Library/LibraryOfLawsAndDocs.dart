import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Library/LibraryBloc.dart';
import 'package:provider/provider.dart';

class LibraryOfLawsAndDocs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LibraryBloc libraryBloc = Provider.of<LibraryBloc>(context);

    return Column(children: [
      // Padding(
      //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //       Padding(
      //           padding: const EdgeInsets.only(left: 8, bottom: 10),
      //           child: Text("Recent Lessons",
      //               style: Theme.of(context).textTheme.headline6.copyWith(
      //                   fontSize: 20, color: Theme.of(context).accentColor))),
      //       Divider(),
      //     ])),
      // Container(
      //     height: 200,
      //     child: ListView.builder(
      //         itemCount: libraryBloc.russell.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           // dynamic key =
      //           //     libraryBloc.lawsAndDocsLibrary.keys.elementAt(index);

      //           return Book(title: libraryBloc.russell[index].toString());
      //         })),
    ]);
  }
}

class Book extends StatelessWidget {
  final String title;

  const Book({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Theme.of(context).accentColor,
        margin: EdgeInsets.all(15),
        child: Text(title,
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 15)));
  }
}
