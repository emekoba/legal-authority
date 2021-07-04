import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Blog/BlogPage/BlogPageCommentSection.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatefulWidget {
  final String title;
  final String description;
  final String content;

  const BlogPage({this.title, this.description, this.content});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  String _commentText;

  bool _inLibrary =
      false; //? find this by asking if the list in library contains
  //? the widget.title..... library["blogs"].contains(widget.title) as bool

  @override
  Widget build(BuildContext context) {
    final ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    final FocusNode _focus = FocusNode();

    TextSpan _wordText = TextSpan(
        text: widget.title,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: Colors.amberAccent, fontSize: 15));

    TextStyle _richTextStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 11);

    void _saveToLibrary() {
      forumsBloc.toggleSaveBlog(
          blog: widget.title, currentSaveStateOfItem: _inLibrary);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).accentColor,
          content: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: _inLibrary ? "removed blog on   " : "saved blog on   ",
                style: TextStyle(color: Colors.white)),
            _wordText,
            TextSpan(
                text: _inLibrary ? "   from library" : "   to library",
                style: TextStyle(color: Colors.white))
          ], style: _richTextStyle)),
          action: SnackBarAction(
              label: "undo", textColor: Colors.red, onPressed: () {})));
    }

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    void _createComment() {
      if (_commentText != null) {
        forumsBloc.commentOnBlog(blogName: widget.title, comment: _commentText);

        setState(() => _commentText = "");
      }
    }

    void _downvoteBlog() {}

    void _upvoteBlog() {}

    void _openSubComments() {}

    void _shareBlog() {}

    return Scaffold(
        body: SafeArea(
            child: StreamBuilder<dynamic>(
                stream: blogsCollection.doc(widget.title).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Offstage();
                  }

                  DocumentSnapshot _blogs_docs =
                      snapshot.data as DocumentSnapshot;

                  bool _upvote =
                      _blogs_docs["upvotes"].contains(fire_user) as bool;

                  bool _downvote =
                      _blogs_docs["downvotes"].contains(fire_user) as bool;

                  return CustomScrollView(slivers: [
                    PageHeader.sliver(
                        // title: title,
                        icon: Icons.arrow_back,
                        onLeadingIconTapped: () => Navigator.pop(context),
                        endWidget: Row(children: [
                          GestureDetector(
                              onTap: _shareBlog,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Theme.of(context).accentColor),
                                  height: 32,
                                  width: 35,
                                  child: Icon(Icons.share_rounded,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 20))),
                          SizedBox(width: 30),
                          GestureDetector(
                              onTap: _upvoteBlog,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: _upvote
                                          ? Theme.of(context).buttonColor
                                          : Theme.of(context).accentColor),
                                  height: 32,
                                  width: 35,
                                  child: Icon(Icons.arrow_upward_rounded,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 20))),
                          SizedBox(width: 10),
                          GestureDetector(
                              onTap: _saveToLibrary,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: _inLibrary
                                          ? Theme.of(context).buttonColor
                                          : Theme.of(context).accentColor),
                                  height: 32,
                                  width: 60,
                                  child: Icon(
                                      _inLibrary
                                          ? Icons.bookmark_rounded
                                          : Icons.bookmark_border_rounded,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 20))),
                          SizedBox(width: 10),
                          GestureDetector(
                              onTap: _downvoteBlog,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: _downvote
                                          ? Theme.of(context).buttonColor
                                          : Theme.of(context).accentColor),
                                  height: 32,
                                  width: 35,
                                  child: Icon(Icons.arrow_downward_rounded,
                                      size: 20,
                                      color:
                                          Theme.of(context).iconTheme.color))),
                          SizedBox(width: 20)
                        ])),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(widget.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontSize: 35))),
                                Offstage(
                                    offstage: widget.description == null ||
                                            widget.description == ""
                                        ? true
                                        : false,
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 20, 8, 40),
                                        child: Text(widget.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(fontSize: 14)))),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 20, 8, 40),
                                    child: Text(widget.content,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                fontSize: 16,
                                                letterSpacing: 1.2,
                                                height: 2))),
                              ]))
                    ])),
                    SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        sliver: BlogPageCommentSection(
                            usersCollection: usersCollection,
                            blogsCollection: blogsCollection.doc(widget.title)))
                  ]);
                })),
        bottomNavigationBar: Offstage(
            offstage: true,
            child: Container(
                padding: MediaQuery.of(context).viewInsets,
                // color: Theme.of(context).accentColor,
                // color: Colors.white10,
                color: Colors.black,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    margin: EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Expanded(
                          child: TextField(
                              focusNode: _focus,
                              maxLines: null,
                              // onChanged: (value) =>
                              //     setState(() => _commentText = value),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'comment..',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          // color: Theme.of(context).primaryColor,
                                          color: Colors.white70,
                                          fontSize: 15)),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 15))),
                      SizedBox(width: 5),
                      IconButton(
                          icon: Icon(Icons.send,
                              color: Theme.of(context).buttonColor),
                          onPressed: _createComment)
                    ])))));
  }
}
