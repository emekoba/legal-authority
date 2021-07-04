import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:legal_authority/Widgets/Functional/RussTextField.dart';
import 'package:legal_authority/Widgets/Functional/SignInUpButton.dart';

class SignUp extends StatefulWidget {
  final Function signUp;

  SignUp({this.signUp});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email;

  String _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up with email address",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 12)),
                  SizedBox(height: 40),
                  RussTextField(
                      hintText: "Email",
                      type: "email",
                      onChange: (String value) =>
                          setState(() => _email = value)),
                  SizedBox(height: 40),
                  RussTextField(
                      hintText: "Password",
                      type: "password",
                      onChange: (String value) =>
                          setState(() => _password = value)),
                  SizedBox(height: 80),
                  SignInUpButton(
                      text: "SIGN UP",
                      onPressed: () => widget.signUp(
                          via: "email", email: _email, password: _password)),
                  SizedBox(height: 60),
                  Text("Sign up with another service",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 12)),
                  SizedBox(height: 40),
                  SignInUpButton(
                      onPressed: () => widget.signUp(via: "google"),
                      text: "Sign up With Google",
                      icon: FontAwesomeIcons.google),
                  SizedBox(height: 40),
                  SignInUpButton(
                      onPressed: () => widget.signUp(via: "facebook"),
                      text: "Sign up with Facebook",
                      icon: FontAwesomeIcons.facebook)
                ])));
  }
}
