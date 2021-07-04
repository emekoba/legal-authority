import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Profile/ProfilePost.dart';

class ProfileList extends StatelessWidget {
  final String user;
  final String forum;
  final List subscribers;

  ProfileList({this.user, this.subscribers, this.forum});

  @override
  Widget build(BuildContext context) {
    return Container(child: ListView(children: []));
  }
}
