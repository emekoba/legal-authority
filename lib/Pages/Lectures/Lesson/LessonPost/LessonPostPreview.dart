import 'package:flutter/material.dart';

class LessonPostPreview extends StatelessWidget {
  final String lesson;
  final AssetImage img;
  final String course;
  final Function saveToLibrary;
  final Function openLessonPage;

  const LessonPostPreview(
      {this.course,
      this.lesson,
      this.img,
      this.saveToLibrary,
      this.openLessonPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => openLessonPage(),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              Expanded(
                  child: Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image(
                        image: img, fit: BoxFit.cover, width: double.infinity)),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white30.withOpacity(0.8),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  child: Text(lesson,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              fontSize: 20,
                                              color: Colors.black,
                                              letterSpacing: 1.8)))),
                          GestureDetector(
                              onTap: () {},
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 20),
                                  child: Container(
                                      height: 45,
                                      width: 150,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Row(children: [
                                        Icon(Icons.play_arrow,
                                            color:
                                                Theme.of(context).buttonColor)
                                      ]))))
                        ]))
              ])),
              Row(children: [
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("$course Law",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(fontSize: 13)))),
                Container(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        icon: Icon(Icons.bookmark_border_rounded,
                            color: Theme.of(context).buttonColor),
                        iconSize: 20,
                        onPressed: () => saveToLibrary()))
              ])
            ])));
  }
}
