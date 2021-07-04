import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Style/BookCover.dart';

class ExpertPage extends StatelessWidget {
  final List<String> social = ["facebook", "twitter", "google", "youtube"];

  void _openFullList() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          Container(
              height: 290,
              child: Stack(children: [
                Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff35354F),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: RaisedButton(
                                      color: Theme.of(context).buttonColor,
                                      shape: CircleBorder(),
                                      onPressed: () => Navigator.pop(context),
                                      child: Icon(Icons.arrow_back,
                                          size: 15,
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color)))
                            ]))),
                Positioned(
                    bottom: 15,
                    left: 30,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 180,
                            width: 105,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                    "lib/Resources/Profile/Sagay2.jfif")))))
              ])),
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(height: 10),
                    Text(
                        "Many Nigerians know Professor Itsejuwa Sagay. You probably know him as a distinguished Professor of Law, a respected Senior Advocate of Nigeria, former Dean of Law of Universities of Ife and Benin, author of landmark legal texts and of course, as the Chairman of the Presidential Advisory Committee on Anti-Corruption.",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(height: 1.5, fontSize: 11))
                  ])),
          Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text("Books",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                              Padding(
                                  padding: EdgeInsets.only(left: 5, bottom: 20),
                                  child: Icon(Icons.store,
                                      color: Theme.of(context).buttonColor,
                                      size: 15))
                            ]),
                            Text("more..",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Theme.of(context).buttonColor))
                          ])))),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: List.generate(
                      8,
                      (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: BookCover(
                                title:
                                    "Legal Aspects of Medical Practise in Nigeria"),
                          )))),
          Container(height: 300),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Connect",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...social
                              .map((e) => Material(
                                  elevation: 4,
                                  shape: CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  child: Ink.image(
                                      image: AssetImage(
                                          "lib/Resources/Icons/$e.png"),
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                      child: InkWell(onTap: () {}))))
                              .toList()
                        ])
                  ]))
        ]))));
  }
}
