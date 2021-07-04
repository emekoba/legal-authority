import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  final Function dismissInput;

  const Articles({Key key, this.dismissInput}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles>
    with AutomaticKeepAliveClientMixin<Articles> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
