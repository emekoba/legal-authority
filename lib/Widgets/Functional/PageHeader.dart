import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final Function onLeadingIconTapped;
  final String title;
  bool isSliver = false;
  final IconData icon;
  final TextStyle titleStyle;
  final Widget endWidget;
  final bool titleBox;
  final double iconSize;

  PageHeader(
      {this.onLeadingIconTapped,
      this.title,
      this.icon,
      this.titleStyle,
      this.endWidget,
      this.titleBox = false,
      this.iconSize});

  PageHeader.sliver(
      {this.onLeadingIconTapped,
      this.title,
      this.icon,
      this.titleStyle,
      this.endWidget,
      this.titleBox = false,
      this.iconSize}) {
    isSliver = true;
  }

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverAppBar(
            elevation: 0,
            expandedHeight: 80,
            leading: Offstage(),
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: RaisedButton(
                          color: Theme.of(context).buttonColor,
                          shape: CircleBorder(),
                          onPressed: () => onLeadingIconTapped(),
                          child: Icon(icon,
                              size: iconSize ?? 18,
                              color: Theme.of(context).iconTheme.color))),
                  titleBox
                      ? Expanded(
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).accentColor,
                                        offset: Offset(0, 2), //(x,y)
                                        blurRadius: 0.8)
                                  ],
                                  color: Theme.of(context).buttonColor,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                              child: Text(title ?? "",
                                  style: titleStyle ??
                                      Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(fontSize: 20)))
                        ]))
                      : Expanded(
                          flex: 2,
                          child: Text(title ?? "",
                              style: titleStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontSize: 15))),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    endWidget == null ? Container(width: 40) : endWidget
                  ])
                ])))
        : Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RaisedButton(
                    color: Theme.of(context).buttonColor,
                    shape: CircleBorder(),
                    onPressed: () => onLeadingIconTapped(),
                    child: Icon(icon,
                        size: iconSize ?? 18,
                        color: Theme.of(context).iconTheme.color))),
            titleBox
                ? Expanded(
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              //   BoxShadow(
                              //       color: Theme.of(context).accentColor,
                              //       offset: Offset(0, 2), //(x,y)
                              //       blurRadius: 0.8)
                            ],
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                        child: Text(title ?? "",
                            style: titleStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 15)))
                  ]))
                : Expanded(
                    child: Text(title ?? "",
                        style: titleStyle ??
                            Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 15))),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              endWidget == null ? Container(width: 40) : endWidget
            ])
          ]);
  }
}
