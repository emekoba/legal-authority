import 'package:flutter/material.dart';

class SignInUpButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const SignInUpButton({Key key, this.text, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () => onPressed(),
        child: Padding(
            padding: icon == null
                ? const EdgeInsets.all(20)
                : const EdgeInsets.all(15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: Center(
                      child: Text(text,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).iconTheme.color)))),
              Offstage(
                  offstage: icon == null,
                  child: Icon(icon, color: Theme.of(context).iconTheme.color))
            ])));
  }
}
