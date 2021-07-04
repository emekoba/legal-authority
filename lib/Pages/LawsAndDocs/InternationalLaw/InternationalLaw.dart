import 'package:flutter/material.dart';

class InternationalLaw extends StatefulWidget {
  final String title;

  const InternationalLaw({Key key, this.title}) : super(key: key);

  @override
  _InternationalLawState createState() => _InternationalLawState();
}

class _InternationalLawState extends State<InternationalLaw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
