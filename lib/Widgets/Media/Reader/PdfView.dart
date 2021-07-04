import 'package:flutter/material.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  // String _filePath = "lib/Resources/Docs/bruh.pdf";
  // PDFDocument _doc;

  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  // Future _initPDF() async {
  //   final doc = await PDFDocument.fromAsset(_filePath);

  //   setState(() {
  //     _doc = doc;
  //   });
  // }

  // void _openBookmarks() {
  //   _pdfViewerKey.currentState?.openBookmarkView();
  // }

  @override
  void initState() {
    super.initState();

    // _initPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // SfPdfViewer.asset(
      //   _filePath,
      //   key: _pdfViewerKey,
      // ),

      // Positioned(
      //     top: 0,
      //     left: 0,
      //     child: Container(
      //         padding: EdgeInsets.symmetric(vertical: 20),
      //         child: RaisedButton(
      //             color: Theme.of(context).buttonColor,
      //             shape: CircleBorder(),
      //             onPressed: () => _openBookmarks(),
      //             child: Icon(Icons.menu,
      //                 size: 18, color: Theme.of(context).iconTheme.color)))),
    ])
        // PDFViewer(
        //     document: _doc,
        //     indicatorBackground: Theme.of(context).buttonColor,
        //     indicatorText: Theme.of(context).iconTheme.color),
        );
  }
}
