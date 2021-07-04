// import 'package:flutter/material.dart';
// import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
// import 'package:quill_delta/quill_delta.dart';
// import 'package:zefyr/zefyr.dart';

// class TlaTextEditor extends StatefulWidget {
//   final String title;

//   const TlaTextEditor({Key key, this.title}) : super(key: key);

//   @override
//   TlaTextEditorState createState() => TlaTextEditorState();
// }

// class TlaTextEditorState extends State<TlaTextEditor> {
//   //?/ Allows to control the editor and the document.
//   ZefyrController _zefyrController;

//   //?/ Zefyr editor like any other input field requires a focus node.
//   FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     //? Here we must load the document and pass it to Zefyr controller.
//     final document = _loadDocument();

//     _zefyrController = ZefyrController(document);

//     _focusNode = FocusNode();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //? Note that the editor requires special `ZefyrScaffold` widget to be
//     //? one of its parents.

//     return Scaffold(
//         //     body: ZefyrScaffold(
//         //         child: SafeArea(
//         //             child: Column(children: [
//         //   PageHeader(
//         //       title: widget.title,
//         //       icon: Icons.arrow_back,
//         //       onLeadingIconTapped: () => Navigator.pop(context),
//         //       titleStyle:
//         //           Theme.of(context).textTheme.headline6.copyWith(fontSize: 16)),
//         //   Expanded(
//         //       child: Container(
//         //           color: Colors.white,
//         //           child: ZefyrTheme(
//         //               data: ZefyrThemeData.fallback(context).copyWith(
//         //                   toolbarTheme: ToolbarTheme.fallback(context)
//         //                       .copyWith(color: Theme.of(context).primaryColor),
//         //                   defaultLineTheme: LineTheme(
//         //                       textStyle: Theme.of(context)
//         //                           .textTheme
//         //                           .headline6
//         //                           .copyWith(
//         //                               fontSize: 15,
//         //                               color: Theme.of(context).primaryColor),
//         //                       padding: EdgeInsets.symmetric(vertical: 20))),
//         //               child: ZefyrEditor(
//         //                   padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
//         //                   controller: _zefyrController,
//         //                   focusNode: _focusNode))))
//         // ])))
//         );
//   }

//   //?/ Loads the document to be edited in Zefyr.
//   NotusDocument _loadDocument() {
//     //? For simplicity we hardcode a simple document with one line of text
//     //? saying "Zefyr Quick Start".
//     //? (Note that delta must always end with newline.)

//     final Delta delta = Delta()..insert("...\n");

//     return NotusDocument.fromDelta(delta);
//   }
// }
