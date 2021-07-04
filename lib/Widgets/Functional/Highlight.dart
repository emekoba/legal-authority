import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Highlight {
  final String text;

  bool shouldHighlight;

  Highlight({@required this.text, @required this.shouldHighlight});

  IconData _getIcon(String page) {
    switch (page) {
      case "law":
        return Icons.gavel_rounded;
        break;

      case "dictionary":
        return FontAwesomeIcons.book;
        break;

      default:
        return Icons.error_rounded;
    }
  }

  WidgetSpan link(String page, Function tap) {
    IconData txtIcon = _getIcon(page);

    TextStyle bruh = TextStyle(
        fontFamily: "Blanco",
        color: Colors.amberAccent,
        fontSize: 20,
        height: 3.8,
        letterSpacing: 2.5);

    switch (page) {
      case "law":
        return WidgetSpan(
            child: GestureDetector(
                onTap: () => tap(type: page, word: text),
                child: Stack(children: [
                  Text(" $text ",
                      style: bruh.copyWith(color: Colors.amberAccent)),
                  Positioned(
                      right: 6,
                      top: 25,
                      child: Icon(txtIcon, size: 12, color: Colors.amberAccent))
                ])));

        break;

      case "dictionary":
        return WidgetSpan(
            child: GestureDetector(
                onTap: () => tap(type: page, word: text),
                child: Stack(children: [
                  Text(" $text ",
                      style: bruh.copyWith(color: Colors.amberAccent)),
                  Positioned(
                      right: 5,
                      top: 26,
                      child: Icon(txtIcon, size: 10, color: Colors.amberAccent))
                ])));

        break;

      default:
        return WidgetSpan(
            child: Stack(children: [
          Text("[error !]", style: bruh.copyWith(color: Colors.red)),
          Positioned(
              right: 6,
              top: 25,
              child: Icon(txtIcon, size: 12, color: Colors.red))
        ]));
    }
  }

  TextSpan plain() {
    return TextSpan(
        text: " $text ", style: TextStyle(color: Colors.blueAccent));
  }
}

//? while typing in workstation of forums, the parser looks at each input,
//? letter by letter, if it spells section, chapter, act etc...it should color it..and
//? get the document for that reference...
