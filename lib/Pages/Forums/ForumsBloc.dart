import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';

class ForumsBloc extends ChangeNotifier {
  CollectionReference get all_forums => forumsCollection;

  CollectionReference get all_blogs => blogsCollection;

  void _subscribeToForum({String forum}) {
    forumsCollection.doc(forum).update(<String, dynamic>{
      "subscribers": FieldValue.arrayUnion(<String>[fire_user])
    });
  }

  void _unsubscribeFromForum({String forum}) {
    forumsCollection.doc(forum).update(<String, dynamic>{
      "subscribers": FieldValue.arrayRemove(<String>[fire_user])
    });
  }

  void toggleSubscribeToForum(
      {String forum, bool currenSubscribedStateOfForum}) {
    switch (currenSubscribedStateOfForum) {
      case true:
        _unsubscribeFromForum(forum: forum);
        break;

      case false:
        _subscribeToForum(forum: forum);
        break;
      default:
    }
  }

  void createNewForum({String forumName, String description}) {
    forumsCollection.doc(forumName).set(<String, dynamic>{
      "description": description ?? "",
      "createdBy": fire_user,
      "dateCreated": "2014", //? use timeago? maybe i dunno
      "moderators": <String>[],
      "subscribers": <String>[],
      "blogs": <String>[]
    });
  }

  void createNewBlog() {}

  void commentOnBlog({
    String blogName,
    String comment,
  }) {
    blogsCollection
        .doc(blogName)
        .collection("comments")
        .doc(comment)
        .set(<String, dynamic>{
      "commenter": fire_user,
      "likes": <String>[],
      "dislikes": <String>[],
      "score": 21
    });
  }

  void upvoteBlog({String blogName}) {}

  void downvoteBlog({String blogName}) {}

  void replyToComment(
      {String blogName, String parentComment, String childComment}) {}

  void saveBlogToLibrary({String blog}) {}

  void removeBlogFromLibrary({String blog}) {}

  void toggleSaveBlog({String blog, bool currentSaveStateOfItem}) {
    if (currentSaveStateOfItem) {
      removeBlogFromLibrary(blog: blog);
    } else {
      saveBlogToLibrary(blog: blog);
    }
  }
}
