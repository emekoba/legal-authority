import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legal_authority/Widgets/Dumb/Dash.dart';
import 'package:legal_authority/Widgets/Dumb/Flag.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatefulWidget {
  SideBar(
      {this.duration,
      this.changePage,
      this.slideLeft,
      this.slideUp,
      this.currentPageName,
      this.openSearch});

  final Duration duration;
  final Function changePage;
  final Function openSearch;
  final Animation<Offset> slideLeft;
  final Animation<Offset> slideUp;
  final String currentPageName;

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Map<String, IconData> btnList = {
    "dashboard": Icons.dashboard,
    "laws and docs": Icons.gavel_rounded,
    "library": Icons.bookmark_rounded,
    "dictionary": FontAwesomeIcons.book,
    "workstation": Icons.edit_outlined,
    "lectures": Icons.laptop_mac_rounded,
    "forums": Icons.web,
    "ask an expert": Icons.face_rounded,
    "store": Icons.store
  };

  @override
  Widget build(BuildContext context) {
    MainBloc mainBloc = Provider.of<MainBloc>(context);

    TextStyle _textStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontWeight: FontWeight.bold, fontSize: 12);

    void _logout() {
      showDialog<Widget>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text("Sign Out ?",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15, color: Colors.redAccent)),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);

                          mainBloc.logoutUser();
                        },
                        child: Text("yes",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).buttonColor))),
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("no",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context).buttonColor)))
                  ]));
    }

    return StreamBuilder<Object>(
        stream: usersCollection.doc(fire_user).snapshots(),
        // stream: null,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Column(children: [
              Stack(children: [
                Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    alignment: Alignment.centerLeft,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      color: Theme.of(context).accentColor)),
                              height: 90,
                              width: 90,
                              child: SpinKitFoldingCube(
                                  size: 20,
                                  color: Theme.of(context).accentColor)),
                          SizedBox(width: 20),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Dash(width: 100, height: 15),
                                SizedBox(height: 12),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Dash(width: 80, height: 15),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text("|",
                                              style: _textStyle.copyWith(
                                                  color: Theme.of(context)
                                                      .buttonColor))),
                                      Dash(width: 80, height: 15),
                                    ]),
                                SizedBox(height: 15),
                                Dash(width: 400, height: 15),
                              ]))
                        ])),
                Positioned(
                    top: 15,
                    right: 30,
                    child: Tooltip(
                        message: "logout",
                        child: ButtonTheme(
                            minWidth: 35,
                            height: 35,
                            child: RaisedButton(
                                onPressed: _logout,
                                shape: CircleBorder(),
                                color: Theme.of(context).buttonColor,
                                child: Icon(Icons.exit_to_app_rounded,
                                    size: 20,
                                    color:
                                        Theme.of(context).iconTheme.color)))))
              ]),
              SizedBox(height: 30),
              Expanded(
                  child: SlideTransition(
                      position: widget.slideLeft,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: btnList.entries
                                  .map((e) => SideBarBtn(
                                      name: e.key,
                                      changePage: widget.changePage,
                                      currentPageName: widget.currentPageName,
                                      icon: e.value,
                                      snapshotHasData: false,
                                      hasPaidSubscription: false))
                                  .toList())))),
              Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 40),
                  child: SlideTransition(
                      position: widget.slideUp,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Tooltip(
                                message: "notifications",
                                child: FlatButton(
                                    onPressed: () =>
                                        widget.changePage("notifications"),
                                    shape: CircleBorder(),
                                    height: 55,
                                    minWidth: 55,
                                    child: Icon(Icons.notifications,
                                        size: 30,
                                        color: Theme.of(context).buttonColor))),
                            ButtonTheme(
                                minWidth: 55,
                                height: 55,
                                child: RaisedButton(
                                    onPressed: () => widget.openSearch(),
                                    shape: CircleBorder(),
                                    color: Theme.of(context).buttonColor,
                                    child: Icon(Icons.search_rounded,
                                        size: 25,
                                        color: Theme.of(context)
                                            .iconTheme
                                            .color))),
                            Tooltip(
                                message: "settings",
                                child: FlatButton(
                                    onPressed: () =>
                                        widget.changePage("settings"),
                                    shape: CircleBorder(),
                                    height: 55,
                                    minWidth: 55,
                                    child: Icon(Icons.settings,
                                        size: 35,
                                        color: Theme.of(context).buttonColor)))
                          ])))
            ]);
          }

          DocumentSnapshot _users_docs = snapshot.data as DocumentSnapshot;

          String _username = _users_docs["username"] as String;

          String _country = _users_docs["country"] as String;

          String _profileImage = _users_docs["profileImage"] as String;

          String _occupation = _users_docs["occupation"] as String;

          String _insitutionName = _users_docs["institutionName"] as String;

          String _levelInInstitution =
              _users_docs["levelInInstitution"] as String;

          bool _hasPaidSubscription =
              _users_docs["hasPaidSubscription"] as bool;

          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Container(
                      padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                      alignment: Alignment.centerLeft,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(children: [
                              Container(
                                  height: 90,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10000),
                                      child: CachedNetworkImage(
                                          imageUrl: _profileImage,
                                          placeholder: (context, _) =>
                                              SpinKitFoldingCube(
                                                  size: 20,
                                                  color: Theme.of(context)
                                                      .accentColor)))),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Flag(
                                      height: 25,
                                      width: 25,
                                      showLabel: false,
                                      country: _country))
                            ]),
                            SizedBox(width: 20),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(_username, style: _textStyle),
                                  SizedBox(height: 12),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(_occupation, style: _textStyle),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text("|",
                                                style: _textStyle.copyWith(
                                                    color: Theme.of(context)
                                                        .buttonColor))),
                                        Text(_levelInInstitution,
                                            style: _textStyle)
                                      ]),
                                  SizedBox(height: 15),
                                  Text(_insitutionName, style: _textStyle)
                                ]))
                          ])),
                  Positioned(
                      top: 15,
                      right: 30,
                      child: Tooltip(
                          message: "logout",
                          child: ButtonTheme(
                              minWidth: 35,
                              height: 35,
                              child: RaisedButton(
                                  onPressed: _logout,
                                  shape: CircleBorder(),
                                  color: Theme.of(context).buttonColor,
                                  child: Icon(Icons.exit_to_app_rounded,
                                      size: 20,
                                      color:
                                          Theme.of(context).iconTheme.color)))))
                ]),
                SizedBox(height: 30),
                Expanded(
                    child: SlideTransition(
                        position: widget.slideLeft,
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: btnList.entries
                                    .map((e) => SideBarBtn(
                                        name: e.key,
                                        changePage: widget.changePage,
                                        currentPageName: widget.currentPageName,
                                        icon: e.value,
                                        snapshotHasData: true,
                                        hasPaidSubscription:
                                            _hasPaidSubscription))
                                    .toList())))),
                Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 40),
                    child: SlideTransition(
                        position: widget.slideUp,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Tooltip(
                                  message: "notifications",
                                  child: FlatButton(
                                      onPressed: () =>
                                          widget.changePage("notifications"),
                                      shape: CircleBorder(),
                                      height: 55,
                                      minWidth: 55,
                                      child: Icon(Icons.notifications,
                                          size: 30,
                                          color:
                                              Theme.of(context).buttonColor))),
                              ButtonTheme(
                                  minWidth: 55,
                                  height: 55,
                                  child: RaisedButton(
                                      onPressed: () => widget.openSearch(),
                                      shape: CircleBorder(),
                                      color: Theme.of(context).buttonColor,
                                      child: Icon(Icons.search_rounded,
                                          size: 25,
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color))),
                              Tooltip(
                                  message: "settings",
                                  child: FlatButton(
                                      onPressed: () =>
                                          widget.changePage("settings"),
                                      shape: CircleBorder(),
                                      height: 55,
                                      minWidth: 55,
                                      child: Icon(Icons.settings,
                                          size: 35,
                                          color:
                                              Theme.of(context).buttonColor)))
                            ])))
              ]);
        });
  }
}

class SideBarBtn extends StatelessWidget {
  const SideBarBtn(
      {this.name,
      this.changePage,
      this.currentPageName,
      this.snapshotHasData,
      this.icon,
      this.hasPaidSubscription});

  final String name;
  final Function changePage;
  final String currentPageName;
  final IconData icon;
  final bool hasPaidSubscription;
  final bool snapshotHasData;

  @override
  Widget build(BuildContext context) {
    Widget _checkSubscriptionState() {
      switch (name) {
        case "workstation":
        case "lectures":
        case "ask an expert":
          if (!hasPaidSubscription) {
            if (snapshotHasData) {
              return Icon(Icons.lock,
                  size: 13, color: Theme.of(context).accentColor);
            } else {
              return SpinKitFoldingCube(
                  size: 8, color: Theme.of(context).accentColor);
            }
          } else {
            return Offstage();
          }
          break;

        default:
          return Offstage();
      }
    }

    return InkWell(
        onTap: () => changePage(name),
        child: Container(
            height: 55,
            child: Row(children: [
              Icon(Icons.arrow_right_sharp,
                  color: currentPageName == name
                      ? Colors.white
                      : Theme.of(context).primaryColor),
              SizedBox(width: 8),
              Text(name.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Icon(icon,
                    color: Theme.of(context).buttonColor,
                    size: name == "dictionary" ? 12 : 15),
              ),
              SizedBox(width: 20),
              _checkSubscriptionState()
            ])));
  }
}
