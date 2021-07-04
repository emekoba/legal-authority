import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';

class MainBloc extends ChangeNotifier {
  Map<String, int> _pageCounter = {
    "dashboard": 0,
    "laws and docs": 0,
    "library": 0,
    "dictionary": 0,
    "workstation": 0,
    "lectures": 0,
    "forums": 0,
    "ask an expert": 0,
    "store": 0,
    "settings": 0,
    "notifications": 0
  };

  Map _user = <String, dynamic>{};

  bool _isSideBarOpen = false;

  bool _hasPaidSubscription = false;

  Map get user => _user;

  bool get isSideBarOpen => _isSideBarOpen;

  Map get pages => _pageCounter;

  void updateUserInfo({String name}) {
    //? just check if any value is not null and proceed..

    //? also save the values to sqflite..
  }

  void onPageEntered({String pageName}) {
    _pageCounter[pageName]++;
  }

  void openSideBar() {
    _isSideBarOpen = true;
  }

  void closeSideBar() {
    _isSideBarOpen = false;
  }

  Future<void> loginUser({String via, String email, String password}) {
    switch (via) {
      case "email":
        fire_auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((registrant) {
          _user["name"] = registrant.user.uid;
        }).catchError((dynamic e) {
          print(e);
        });

        break;

      case "google":
        break;

      case "facebook":
        break;

      default:
        print("error");
    }
    return null;
  }

  Future<void> logoutUser() {
    closeSideBar();

    fire_auth.signOut().then((registrant) {
      // _userLoggedIn = false;

      _user = <String, dynamic>{};
    });

    return null;
  }

  Future<void> registerUser({String via, String email, String password}) {
    switch (via) {
      case "email":
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((registrant) {
          _user["id"] = registrant.user.uid;
          _user["email"] = registrant.user.email;
          _user["password"] = password;
        }).catchError((dynamic e) {
          print(e);
        });

        break;

      case "google":
        break;

      case "facebook":
        break;

      default:
        print("error");
    }
    return null;
  }

  Future<void> setUpUserForAppAndOnline({
    String username,
    String typeOfUser,
    String occupation,
    String institutionName,
    String typeOfInstitution,
    String country,
    String profileImage,
    String levelInInstitution,
  }) async {
    await usersCollection.doc(_user["id"] as String).set(<String, dynamic>{
      "username": username,
      "email": _user["email"] as String,
      "password": _user["password"] as String,
      "occupation": occupation,
      "institutionName": institutionName,
      "institutionType": typeOfInstitution,
      "profileImage": profileImage,
      "country": country,
      "typeOfUser": typeOfUser,
      "levelInInstitution": levelInInstitution,
      "hasPaidSubscription": false
    }).then((_) {
      loginUser(
          via: "email",
          email: _user["email"] as String,
          password: _user["password"] as String);
    });

    return null;
  }

  void _saveToOfflineDatabase() {
    // ? sqflite is going to save settings such as Map _user,
    // ? people setting the reader to noteview mode etc..
    // ? perhaps create settings block that handles settings for all pages
    // ? as well as settings for the whole app such as theme....

    //? called from any function here to save their values to the phone..

    //? we may need to save the state of where the user was last time they used the app
    //? so if they close the app wehn in dictionary, let this be saved for when rebooted
  }

  void _monitorAppUsage() {
    //? create a function to find out what people spend most of their time on....

    //? monitor the pages gone into..add the tally to offline database..when
    //? a threshold(end of month, over 100 pag transitions etc), upload the
    //? value to the firebase console..
  }
}

//? timer at the top of subscription based pages...in the pageheader..
