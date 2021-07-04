import 'package:flutter/material.dart';
import 'package:legal_authority/Widgets/Functional/RussTextField.dart';
import 'package:legal_authority/Widgets/Functional/SignInUpButton.dart';

class SignIn extends StatefulWidget {
  final Function signIn;

  SignIn({this.signIn});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email;

  String _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaBtn(
                            platform: "google",
                            onTap: () => widget.signIn(via: "google")),
                        SocialMediaBtn(
                            platform: "linkedin",
                            onTap: () => widget.signIn(via: "linkedin")),
                        SocialMediaBtn(
                            platform: "facebook",
                            onTap: () => widget.signIn(via: "facebook"))
                      ]),
                  SizedBox(height: 100),
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
                      text: "Sign In",
                      onPressed: () => widget.signIn(
                          via: "email", email: _email, password: _password)),
                  SizedBox(height: 100)
                ])));
  }
}

class SocialMediaBtn extends StatelessWidget {
  final String platform;
  final Function onTap;

  const SocialMediaBtn({this.platform, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
            height: 60,
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Center(
                child: Image(
                    image: AssetImage('lib/Resources/Icons/$platform.png'),
                    height: platform == "google" ? 33 : 40))));
  }
}
