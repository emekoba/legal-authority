import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class Dashboard extends StatelessWidget {
  final Function openSidebar;

  const Dashboard({this.openSidebar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        PageHeader.sliver(
            title: "DASHBOARD",
            icon: Icons.dashboard_rounded,
            onLeadingIconTapped: openSidebar)
      ]),
    );
  }
}

//new law reports...new laws and lectures added
