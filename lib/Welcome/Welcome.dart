import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legal_authority/Welcome/SignIn.dart';
import 'package:legal_authority/Welcome/SignUp.dart';
import 'package:legal_authority/Welcome/UserInfoRegistrationPage.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:provider/provider.dart';
import 'package:legal_authority/Widgets/Functional/TabBars/BottomTabBar.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _welcomePages = PageController(initialPage: 0);

  bool _isLoading = false;

  void _goToUserInfoPage() {
    Navigator.push(
        context,
        MaterialPageRoute<Widget>(
            builder: (context) => UserInfoRegistrationPage()));
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    void _signUp({String via, String email, String password}) async {
      _dismissInput();

      switch (via) {
        case "email":
          if (email.isEmpty || password.isEmpty) {
            await showDialog<Widget>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                        backgroundColor: Theme.of(context).primaryColor,
                        title: Text("error",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 14, color: Colors.redAccent)),
                        content: Text("email or password field is empty",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 15)),
                        actions: [
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("ok"))
                        ]));
          } else {
            setState(() => _isLoading = true);

            await mainBloc.registerUser(
                via: via, email: email, password: password);

            setState(() => _isLoading = false);

            _goToUserInfoPage();
          }
          break;
        default:
      }
    }

    void _signIn({String via, String email, String password}) async {
      _dismissInput();

      switch (via) {
        case "email":
          if (email.isEmpty || password.isEmpty) {
            await showDialog<Widget>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                        backgroundColor: Theme.of(context).primaryColor,
                        title: Text("error",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 14, color: Colors.redAccent)),
                        content: Text("email or password field is empty",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 15)),
                        actions: [
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("ok"))
                        ]));
          } else {
            setState(() => _isLoading = true);

            await mainBloc.loginUser(
                via: via, email: email, password: password);

            setState(() => _isLoading = false);
          }
          break;

        case "google":
          break;

        case "linkedin":
          break;

        case "facebook":
          break;

        default:
      }
    }

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
                onTap: _dismissInput,
                child: Stack(children: [
                  Column(children: [
                    Expanded(
                        child: PageView(
                            controller: _welcomePages,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                          SignIn(signIn: _signIn),
                          SignUp(signUp: _signUp)
                        ])),
                    BottomTabBar(controller: _welcomePages)
                  ]),
                  Offstage(
                      offstage: !_isLoading,
                      child: Container(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          child: Center(
                              child: SpinKitFoldingCube(
                                  size: 70,
                                  color: Theme.of(context).buttonColor))))
                ]))));
  }
}
