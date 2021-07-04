import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:legal_authority/Pages/Forums/Forum/ForumPost/ForumPost.dart';

class SubCategory extends StatefulWidget {
  final Query subCategory;
  final String user;
  final bool header;

  String type;

  SubCategory({this.subCategory, this.user, this.header = false});

  SubCategory.full({this.subCategory, this.user, this.header = false}) {
    type = "full";
  }

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory>
    with AutomaticKeepAliveClientMixin<SubCategory> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    return StreamBuilder<dynamic>(
        stream: widget.subCategory.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Theme.of(context).buttonColor)));
          }

          return GridView.builder(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length as int,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: widget.type == "full" ? 0.6 : 0.65,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot _forums_docs =
                    snapshot.data.documents[index] as DocumentSnapshot;

                bool _isSubscribed =
                    _forums_docs["subscribers"].contains(fire_user) as bool;

                if (widget.type == "full") {
                  return ForumPost.full(
                      isSubscribed: _isSubscribed,
                      docRef: forumsBloc.all_forums.doc(_forums_docs.id),
                      user: widget.user,
                      title: _forums_docs.id,
                      subscribers: _forums_docs["subscribers"].length as int,
                      moderators: _forums_docs["moderators"].length as int,
                      blogs: _forums_docs["blogs"].length as int);
                }

                return ForumPost(
                    isSubscribed: _isSubscribed,
                    docRef: forumsBloc.all_forums.doc(_forums_docs.id),
                    user: widget.user,
                    title: _forums_docs.id,
                    subscribers: _forums_docs["subscribers"].length as int,
                    moderators: _forums_docs["moderators"].length as int,
                    blogs: _forums_docs["blogs"].length as int);
              });
        });
  }

  @override
  bool get wantKeepAlive => true;
}
