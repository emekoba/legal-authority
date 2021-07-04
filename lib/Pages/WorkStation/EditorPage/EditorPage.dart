import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:legal_authority/Widgets/Functional/TlaTextEditor.dart';

class EditorPage extends StatelessWidget {
  List<String> _menuItems = [
    "1st semester term paper ",
    "old drafts",
  ];

  @override
  Widget build(BuildContext context) {
    _goToTextEditor(String title) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute<Widget>(
      //         builder: (context) => TlaTextEditor(title: title)));
    }

    void _newDocument() {}

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: _newDocument,
            backgroundColor: Theme.of(context).buttonColor,
            child: Icon(Icons.add, color: Theme.of(context).iconTheme.color)),
        body: Column(children: [
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: _menuItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) => MenuItem(
                      title: _menuItems[index], openEditor: _goToTextEditor)))
        ]));
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Function openEditor;

  const MenuItem({this.title, this.openEditor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openEditor(title),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 20))))),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )))),
          ])),
    );
  }
}
