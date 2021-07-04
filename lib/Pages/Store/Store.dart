import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class Store extends StatelessWidget {
  final Function openSidebar;

  Store({this.openSidebar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        PageHeader.sliver(
            title: "STORE",
            icon: Icons.store,
            onLeadingIconTapped: openSidebar),
        SliverFillRemaining(child: Container())
      ]),
    );
  }
}
