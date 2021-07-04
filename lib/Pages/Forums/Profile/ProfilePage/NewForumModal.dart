import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:legal_authority/Widgets/Functional/RussTextField.dart';
import 'package:provider/provider.dart';

class NewForumModal extends StatefulWidget {
  @override
  _NewForumModalState createState() => _NewForumModalState();
}

class _NewForumModalState extends State<NewForumModal> {
  String _forumName;

  @override
  Widget build(BuildContext context) {
    ForumsBloc forumsBloc = Provider.of<ForumsBloc>(context);

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    void _createNewForum() {
      if (_forumName == null) {
        showDialog<Widget>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text("error",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 14, color: Colors.redAccent)),
                    content: Text("add forum name",
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
        forumsBloc.createNewForum(forumName: _forumName);
      }

      Navigator.pop(context);
    }

    return GestureDetector(
        onTap: _dismissInput,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Wrap(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 40),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("New Forum",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 15)),
                        SizedBox(width: 15),
                        Icon(Icons.add, color: Theme.of(context).buttonColor)
                      ])),
              RussTextField(
                  hintText: "forum name...",
                  onChange: (String value) =>
                      setState(() => _forumName = value)),
              SizedBox(height: 500),
              Container(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                      onPressed: _createNewForum,
                      child: Text("create",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 15,
                              color: Theme.of(context).iconTheme.color)))),
              SizedBox(height: 50),
            ])));
  }
}
