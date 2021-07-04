import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  BookCover(
      {this.title,
      this.image,
      this.description,
      this.content,
      this.openBook,
      this.hasBeenOpened});

  BookCover.expert(
      {this.title,
      this.image,
      this.description,
      this.content,
      this.openBook,
      this.hasBeenOpened});

  final AssetImage image;
  final String description;
  final String title;
  final Function openBook;
  final bool hasBeenOpened;
  final String content;

  @override
  Widget build(BuildContext context) {
    const BoxDecoration cover_decoration = const BoxDecoration(
        color: Color(0xff35354F),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(50)));

    Center cover_text = Center(
        child: Text(title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "ProximaNova-Extrabold",
                height: 2,
                letterSpacing: 1)));

    return GestureDetector(
        onTap: () => openBook(title, description, content),
        child: Container(
            height: 200,
            width: 150,
            margin: EdgeInsets.only(bottom: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Stack(children: [
              Column(children: [
                Expanded(
                    child: Container(
                        width: 140,
                        decoration: cover_decoration,
                        child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: cover_text))),
                SizedBox(height: 10)
              ]),
              Container(
                  height: 40,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        width: 40,
                        decoration: const BoxDecoration(
                            // color: Theme.of(context).buttonColor,
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(20))),
                        child: Tooltip(
                            message: "add to library",
                            preferBelow: false,
                            child: IconButton(
                                icon: Icon(Icons.bookmark_border_rounded),
                                iconSize: 18,
                                color: Theme.of(context).iconTheme.color,
                                onPressed: () {})))
                  ]))
            ])));
  }
}
