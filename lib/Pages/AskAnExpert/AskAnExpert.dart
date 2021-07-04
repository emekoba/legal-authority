import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/AskAnExpert/ExpertPage/ExpertPage.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';

class AskAnExpert extends StatefulWidget {
  final Function openSidebar;

  AskAnExpert({this.openSidebar});

  @override
  _AskAnExpertState createState() => _AskAnExpertState();
}

class _AskAnExpertState extends State<AskAnExpert> {
  void _openExpertPage() {
    Navigator.push(
        context, MaterialPageRoute<Widget>(builder: (context) => ExpertPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        PageHeader.sliver(
            title: "ASK AN EXPERT",
            icon: Icons.face_rounded,
            onLeadingIconTapped: widget.openSidebar),
        SliverFillRemaining(
            child: InkWell(
                onTap: _openExpertPage,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                )))
      ]),
    );
  }
}
