import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Pages/Forums/Forum/ForumList/ForumList.dart';
import 'package:legal_authority/Pages/Forums/Profile/ProfilePage/NewForumModal.dart';
import 'package:legal_authority/Pages/Forums/Profile/ProfilePage/SubCategory.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/SideTabBar.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final CollectionReference forums;

  bool others = false;

  ProfilePage({this.username, this.forums});

  ProfilePage.others({this.username, this.forums}) {
    others = true;
  }

  @override
  Widget build(BuildContext context) {
    void _expandCategory(String category) {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) => ForumList(category: category)));
    }

    return others
        ? Others(user: username, expand: _expandCategory)
        : Mine(
            user: "Russell Emekoba", expand: _expandCategory, forums: forums);
  }
}

class Others extends StatelessWidget {
  final Function expand;
  final String user;

  const Others({this.expand, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      CustomScrollView(slivers: [
        PageHeader.sliver(
            title: user,
            icon: Icons.arrow_back,
            titleStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 16, color: Theme.of(context).accentColor),
            onLeadingIconTapped: () => Navigator.pop(context)),
        SliverList(
            delegate: SliverChildListDelegate([
          // SubCategory(subCategory: "created"),
          // SubCategory(subCategory: "subscribed"),
          InkWell(
              onTap: () => expand("blogs"),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text("BLOGS",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        SizedBox(width: 15),
                        Icon(Icons.text_snippet_rounded,
                            size: 15, color: Theme.of(context).buttonColor)
                      ])))),
          Container(height: 300)
        ]))
      ]),
      Positioned(
          top: 80,
          left: 20,
          child: FittedBox(
              child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      AssetImage("lib/Resources/Profile/Profile3.jpg"),
                  minRadius: 25)))
    ])));
  }
}

class Mine extends StatefulWidget {
  final Function expand;
  final String user;
  final CollectionReference forums;

  const Mine({this.expand, this.user, this.forums});

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  PageController _pageController = PageController();

  Widget build(BuildContext context) {
    void _newForumItem() {
      showModalBottomSheet<Widget>(
          backgroundColor: Theme.of(context).primaryColor,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return NewForumModal();
          });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: _newForumItem,
            backgroundColor: Theme.of(context).buttonColor,
            //  label: Text("New",
            //     style: Theme.of(context).textTheme.headline6.copyWith(
            //         fontSize: 15, color: Theme.of(context).primaryColor))
            label: Icon(Icons.add, color: Theme.of(context).iconTheme.color)),
        body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(children: [
              SideTabBar(
                  uppercase: true,
                  control: _pageController,
                  tabs: <String>[
                    "blogs",
                    "created forums",
                    "subscribed forums"
                  ]),
              Expanded(
                  child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: [
                    Container(
                        child: Center(
                            child: Text("blogs opened/ interacted with"))),
                    SubCategory.full(
                        user: widget.user,
                        subCategory: widget.forums
                            .where("createdBy", isEqualTo: fire_user)),
                    SubCategory.full(
                        user: widget.user,
                        subCategory: widget.forums
                            .where("subscribers", arrayContains: fire_user)),
                    Container(child: Center(child: Text("replies/comments"))),
                  ]))
            ])));
  }
}
