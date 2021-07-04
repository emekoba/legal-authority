import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:legal_authority/LegalAuthority.dart';
import 'package:legal_authority/Pages/Dictionary/DictionaryBloc.dart';
import 'package:legal_authority/Pages/Forums/ForumsBloc.dart';
import 'package:legal_authority/Pages/Lectures/LecturesBloc.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Pages/Library/LibraryBloc.dart';
import 'package:legal_authority/Pages/WorkStation/WorkstationBloc.dart';
import 'package:legal_authority/Welcome/Welcome.dart';
import 'package:legal_authority/Widgets/Style/AppTheme.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MainBloc>.value(value: MainBloc()),
          ChangeNotifierProvider<LawsAndDocsBloc>.value(
              value: LawsAndDocsBloc()),
          ChangeNotifierProvider<LibraryBloc>.value(value: LibraryBloc()),
          ChangeNotifierProvider<DictionaryBloc>.value(value: DictionaryBloc()),
          ChangeNotifierProvider<WorkstationBloc>.value(
              value: WorkstationBloc()),
          ChangeNotifierProvider<LecturesBloc>.value(value: LecturesBloc()),
          ChangeNotifierProvider<ForumsBloc>.value(value: ForumsBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthenticationWrapper(),
          theme: AppTheme.dark,
          darkTheme: AppTheme.dark,
        ));
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool userLoggedIn = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user.uid != null) {
        setState(() => userLoggedIn = true);
      } else {
        setState(() => userLoggedIn = false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userLoggedIn ? LegalAuthority() : Welcome();
  }
}
