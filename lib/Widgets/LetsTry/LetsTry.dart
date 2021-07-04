import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Media/Reader/PdfView.dart';
import 'package:legal_authority/Widgets/LetsTry/TryTopTabBar.dart';

class LetsTry extends StatefulWidget {
  @override
  _LetsTryState createState() => _LetsTryState();
}

class _LetsTryState extends State<LetsTry> {
  @override
  Widget build(BuildContext context) {
    PageController _page = PageController();
    int currentIndex = 0;

    void goToReader() {
      Navigator.push(
          context, MaterialPageRoute<Widget>(builder: (context) => PdfView()));
    }

    return Scaffold(
        body: Column(children: [
      TryTopTabBar(
          currentIndex: currentIndex,
          control: _page,
          tabs: <String>["first", "second"]),
      Expanded(
          child: PageView(
              onPageChanged: (idx) => setState(() {
                    currentIndex = idx;
                  }),
              controller: _page,
              children: [
            Container(
                color: Colors.blueGrey, child: Center(child: Text("first"))),
            Container(color: Colors.grey, child: Center(child: Text("second"))),
          ]))
    ])
//
//
//
//
//
//
//
//
//
//
//
////
//
//
//
//
////
//
//
//
//
////
//
//
//
//
////
//
//
//
//
////
//
//
//
//
//
        // CustomScrollView(slivers: [
        //   SliverAppBar(
        //       elevation: 0,
        //       expandedHeight: 80,
        //       floating: true,
        //       flexibleSpace: FlexibleSpaceBar(
        //           background: Row(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //             Container(
        //                 padding: EdgeInsets.symmetric(vertical: 20),
        //                 child: RaisedButton(
        //                     color: Theme.of(context).buttonColor,
        //                     shape: CircleBorder(),
        //                     onPressed: () => goToReader(),
        //                     child: Icon(Icons.dashboard,
        //                         size: 18,
        //                         color: Theme.of(context).iconTheme.color))),
        //             Text("DASHBOARD",
        //                 style:
        //                     TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
        //           ]))),
        //   // SliverList(
        //   //     delegate: SliverChildListDelegate([
        //   //   ...List.generate(
        //   //       20, (index) => Container(height: 200, color: Colors.grey))
        //   // ]))
        // ]),
        );
  }
}
//
//
//
//
//
//
//
//
//
//
//
////
//
//
//
//
////
//
//
//
//
////
//
//
//
//
////
//
//
//
//
////
//
//
//
//
//
// import 'package:flutter/material.dart';

// class Drafts extends StatefulWidget {
//   Drafts({this.flex, this.tabs, this.control, this.currentIndex});

//   Drafts.icon({this.flex, this.tabs, this.control, this.currentIndex}) {
//     isIcon = true;
//   }

//   int currentIndex;
//   bool isIcon = false;
//   bool flex = false;
//   List tabs;
//   PageController control;

//   @override
//   _DraftsState createState() => _DraftsState();
// }

// class _DraftsState extends State<Drafts> {
//   Map<int, bool> _tabs = {};

//   void _selectTab(name) {
//     setState(() {
//       widget.currentIndex = name;

//       _tabs.forEach((key, value) {
//         if (key != widget.currentIndex) {
//           _tabs[widget.currentIndex] = false;
//         }
//       });
//       _tabs[widget.currentIndex] = true;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     int x = 0;

//     setState(() {
//       if (widget.tabs.length > 4 && !widget.isIcon) {
//         widget.flex = true;
//       }

//       widget.tabs.forEach((e) {
//         _tabs[x] = x == widget.currentIndex ? true : false;

//         x++;
//       });
//     });

//     print(_tabs);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
//         height: 35,
//         decoration: const BoxDecoration(
//             color: Color(0xff35354F),
//             borderRadius: BorderRadius.all(Radius.circular(5))),
//         child: widget.flex == true
//             ? SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                     children: _tabs.entries
//                         .map((e) => bar(context, widget.isIcon, widget.flex,
//                             e.key, e.value, _selectTab))
//                         .toList()))
//             : Row(
//                 children: _tabs.entries
//                     .map((e) => bar(context, widget.isIcon, widget.flex, e.key,
//                         e.value, _selectTab))
//                     .toList()));
//   }
// }

// Widget bar(context, isIcon, flex, value, active, selectTab) {
//   return flex != true
//       ? Expanded(
//           child: GestureDetector(
//               onTap: () => selectTab(value),
//               child: AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   decoration: const BoxDecoration(
//                       color: active
//                           ? Theme.of(context).buttonColor
//                           : Colors.transparent,
//                       border: active ? Border.all(width: 2.5) : null,
//                       borderRadius: BorderRadius.all(Radius.circular(5))),
//                   child: Center(
//                       child: isIcon
//                           ? Icon(value,
//                               color: active ? Theme.of(context).accentColor : Colors.white30)
//                           : Text(value,
//                               style: Theme.of(context).textTheme.headline2.copyWith(
//                                   fontSize: 10,
//                                   color:
//                                       active ? Theme.of(context).accentColor : Colors.white))))))
//       : GestureDetector(
//           onTap: () => selectTab(value),
//           child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               constraints: BoxConstraints(minWidth: 150),
//               decoration: const BoxDecoration(
//                   color: active
//                       ? Theme.of(context).buttonColor
//                       : Colors.transparent,
//                   border: active ? Border.all(width: 2.5) : null,
//                   borderRadius: BorderRadius.all(Radius.circular(5))),
//               child: Center(
//                   child: isIcon
//                       ? Icon(value)
//                       : Text(value,
//                           style: Theme.of(context).textTheme.headline2.copyWith(
//                               fontSize: 9,
//                               color: active ? Theme.of(context).accentColor : Colors.white)))));
// }
