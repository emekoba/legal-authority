import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/Profile/ProfilePage/ProfilePage.dart';

class ProfilePost extends StatelessWidget {
  final String name;

  const ProfilePost({this.name});

  @override
  Widget build(BuildContext context) {
    void _openProfilePage() {
      Navigator.push(
          context,
          MaterialPageRoute<Widget>(
              builder: (context) => ProfilePage.others(username: name)));
    }

    return InkWell(
        onTap: _openProfilePage,
        child: Column(children: [
          Divider(height: 0),
          Padding(
              padding: const EdgeInsets.all(20),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                FittedBox(
                    child: CircleAvatar(
                        minRadius: 30,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            AssetImage("lib/Resources/Profile/Profile1.jpg"))),
                SizedBox(width: 20),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Russell Emekoba",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 15)),
                            Text("Nigeria",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 10))
                          ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text("Student: ",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 13)),
                        SizedBox(width: 10),
                        Text("University of Calabar",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 10))
                      ]),
                    ]))
              ]))
        ]));
  }
}

//todo: get the mainbloc to check the status of the user and the institution they
//todo: work in...
