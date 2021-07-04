import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Blog/BlogPost.dart';
import 'package:legal_authority/Pages/Forums/Forum/ForumPost/ForumPost.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';

class Home extends StatefulWidget {
  final CollectionReference blogs;
  final CollectionReference forums;
  final Function openSidebar;

  const Home({this.blogs, this.forums, this.openSidebar});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(slivers: [
      PageHeader.sliver(
          title: "FORUMS",
          icon: Icons.web,
          onLeadingIconTapped: widget.openSidebar),
      StreamBuilder<dynamic>(
          stream: widget.blogs.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SliverToBoxAdapter(child: BlogPost.loading());
            }

            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              DocumentSnapshot _blogs_docs =
                  snapshot.data.documents[index] as DocumentSnapshot;

              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: BlogPost(
                      forum: _blogs_docs["createdInForum"] as String,
                      content: _blogs_docs["content"] as String,
                      title: _blogs_docs.id,
                      description: _blogs_docs["description"] as String));
            }, childCount: snapshot.data.documents.length as int));
          }),
      SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 10),
                        child: Text("Top Forums",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 20,
                                    color: Theme.of(context).accentColor))),
                    Divider(),
                  ]))),
      SliverToBoxAdapter(
          child: Container(
              height: 210,
              child: StreamBuilder<dynamic>(
                  stream: widget.forums.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }

                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        itemCount: snapshot.data.documents.length as int,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot _forums_docs = snapshot
                              .data.documents[index] as DocumentSnapshot;

                          bool _isSubscribed = _forums_docs["subscribers"]
                              .contains(fire_user) as bool;

                          return Container(
                              margin: EdgeInsets.only(right: 25),
                              child: ForumPost(
                                  isSubscribed: _isSubscribed,
                                  width: 120,
                                  docRef: widget.forums.doc(_forums_docs.id),
                                  title: _forums_docs.id,
                                  subscribers:
                                      _forums_docs["subscribers"].length as int,
                                  moderators:
                                      _forums_docs["moderators"].length as int,
                                  blogs: _forums_docs["blogs"].length as int));
                        });
                  }))),
      SliverToBoxAdapter(child: Container(height: 50))
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
