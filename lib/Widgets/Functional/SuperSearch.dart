import 'package:flutter/material.dart';

class SuperSearch extends SearchDelegate<String> {
  List family = <String>[
    "Russell",
    "viscount",
    "Baron",
    "Bailey",
    "Edmund",
    "Ceasar"
  ];

  List recent = <String>["Russell", "Edmund", "Ceasar"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recent
        : family.where((dynamic txt) => txt.startsWith(query) as bool).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text(suggestionList[index].toString())));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);

    final ThemeData theme = Theme.of(context).copyWith(
        textTheme: TextTheme(
            headline6: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white, fontSize: 20)),
        appBarTheme: AppBarTheme(color: Theme.of(context).accentColor));

    assert(theme != null);

    return theme;
  }
}
