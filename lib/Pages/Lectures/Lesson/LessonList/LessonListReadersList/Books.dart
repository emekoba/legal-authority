import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  final Function dismissInput;

  const Books({Key key, this.dismissInput}) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books>
    with AutomaticKeepAliveClientMixin<Books> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
