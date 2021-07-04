import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Forum/ForumPost/ForumPost.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';

class ForumList extends StatelessWidget {
  final String category;
  final String user;

  ForumList({this.category, this.user});

  @override
  Widget build(BuildContext context) {
    final ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    return Scaffold(
        // floatingActionButton: Padding(
        //     padding: EdgeInsets.only(right: 10, bottom: 20),
        //     child: FloatingActionButton(
        //         // mini: true,
        //         onPressed: null,
        //         backgroundColor: Theme.of(context).buttonColor,
        //         child: Text("${forumsBloc.created_forums.length}",
        //             // "${category == 'created' ? forumsBloc.created_forums.length : forumsBloc.subscribed_forums.length.toString()}",
        //             style: Theme.of(context).textTheme.headline6.copyWith(
        //                 fontSize: 20, color: Theme.of(context).accentColor)))),
        body: SafeArea(
            child: CustomScrollView(slivers: [
      PageHeader.sliver(
          title: category,
          titleStyle: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 16, color: Theme.of(context).accentColor),
          icon: Icons.arrow_back,
          onLeadingIconTapped: () => Navigator.pop(context)),

      // StreamBuilder<dynamic>(
      //     stream:
      //         //  category == "created"
      //         //     ? forumsBloc.created_forums
      //         // :
      //         forumsBloc.subscribed_forums,
      //     builder: (context, snapshot) {
      // if (!snapshot.hasData) {
      //   return Column(children: [
      //     SizedBox(height: 20),
      //     SizedBox(
      //         height: 20,
      //         width: 20,
      //         child: CircularProgressIndicator(
      //             strokeWidth: 2,
      //             backgroundColor: Theme.of(context).buttonColor))
      //   ]);
      // }
      //   return SliverGrid.count(
      //     SliverGrid.count(
      //     mainAxisSpacing: 30,
      //     childAspectRatio: 0.6,
      //     crossAxisSpacing: 25,
      //     crossAxisCount: 2,
      //     children:
      //         DocumentSnapshot _forums_docs =
      //             snapshot.data.documents[index] as DocumentSnapshot;

      //         return ForumPost.full(
      //             user: user,
      //             title: _forums_docs.id,
      //             subscribers: _forums_docs["subscribers"].length as int,
      //             moderators: _forums_docs["moderators"].length as int,
      //             blogs: _forums_docs["blogs"].length as int);
      //       });
      // }),
      SliverPadding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 80),
          sliver: SliverGrid.count(
              mainAxisSpacing: 30,
              childAspectRatio: 0.6,
              crossAxisSpacing: 25,
              crossAxisCount: 2,
              children: []))
    ])));
  }
}
