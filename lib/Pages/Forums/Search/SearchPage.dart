import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Forum/ForumPost/ForumPost.dart';
import 'package:legal_authority/Widgets/Functional/SearchBox.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';

class SearchPage extends StatefulWidget {
  final CollectionReference forums;
  final CollectionReference blogs;
  final List subscribers;

  const SearchPage({this.forums, this.blogs, this.subscribers});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin<SearchPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    return GestureDetector(
        onTap: _dismissInput,
        child: Column(children: [
          SizedBox(height: 30),
          SearchBox(),
          StreamBuilder<dynamic>(
              stream: widget.forums.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      child: Center(
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor:
                                      Theme.of(context).buttonColor))));
                }
                return GridView.builder(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    // primary: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length as int,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot _forums_docs =
                          snapshot.data.documents[index] as DocumentSnapshot;

                      bool _isSubscribed = _forums_docs["subscribers"]
                          .contains(fire_user) as bool;

                      return ForumPost(
                          isSubscribed: _isSubscribed,
                          docRef: widget.forums.doc(_forums_docs.id),
                          title: _forums_docs.id,
                          subscribers:
                              _forums_docs["subscribers"].length as int,
                          moderators: _forums_docs["moderators"].length as int,
                          blogs: _forums_docs["blogs"].length as int);
                    });
              })
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
