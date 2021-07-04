import 'package:flutter/material.dart';

class LawReports extends StatefulWidget {
  final String title;

  const LawReports({this.title});

  @override
  _LawReportsState createState() => _LawReportsState();
}

class _LawReportsState extends State<LawReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Text("weekly monthly law reports, index with all the books "),
        ));
  }
}
