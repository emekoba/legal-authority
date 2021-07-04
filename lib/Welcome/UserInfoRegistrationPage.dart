import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_authority/LegalAuthority.dart';
import 'package:legal_authority/Widgets/Dumb/Flag.dart';
import 'package:legal_authority/Widgets/Functional/RussTextField.dart';
import 'package:legal_authority/Widgets/Functional/SignInUpButton.dart';
import 'package:legal_authority/Widgets/Network/Firebase.dart';
import 'package:legal_authority/mainBloc.dart';
import 'package:provider/provider.dart';

class UserInfoRegistrationPage extends StatefulWidget {
  @override
  _UserInfoRegistrationPageState createState() =>
      _UserInfoRegistrationPageState();
}

class _UserInfoRegistrationPageState extends State<UserInfoRegistrationPage> {
  String _username;

  String _institutionName;

  String _levelInInstitution;

  String _countrySelected = "Nigeria";

  String _occupation = "Lawyer";

  String _institutionType = "Court";

  String _typeOfUser = "government";

  File _profileImage;

  bool _isLoading = false;

  int _selectedOccupation = 2;

  int _selectedInstitution = 2;

  void _newCountrySelected(String country) {
    setState(() => _countrySelected = country);
  }

  void _pickImage(ImageSource source) async {
    final image = await ImagePicker().getImage(source: source);

    setState(() => _profileImage = File(image.path));

    print(_profileImage);
  }

  void _selectOccupation(int value) {
    setState(() {
      _selectedOccupation = value;
      // _occupation =
    });
  }

  void _selectInstitutionType(int value) {
    setState(() {
      _selectedOccupation = value;
      // _occupation =
    });
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = Provider.of<MainBloc>(context);

    final TextStyle _textStyle =
        Theme.of(context).textTheme.headline6.copyWith(fontSize: 15);

    final List<DropdownMenuItem<int>> _institutions = [
      DropdownMenuItem<int>(value: 1, child: Text("Court", style: _textStyle)),
      DropdownMenuItem<int>(
          value: 2, child: Text("University", style: _textStyle)),
      DropdownMenuItem<int>(
          value: 3, child: Text("Chamber", style: _textStyle)),
    ];

    final List<DropdownMenuItem<int>> _occupations = [
      DropdownMenuItem<int>(value: 1, child: Text("Lawyer", style: _textStyle)),
      DropdownMenuItem<int>(
          value: 2, child: Text("Student", style: _textStyle)),
      DropdownMenuItem<int>(
          value: 3, child: Text("Lecturer", style: _textStyle)),
    ];

    void _dismissInput() {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        _focus.unfocus();
      }
    }

    bool _onScroll(dynamic t) {
      final FocusScopeNode _focus = FocusScope.of(context);

      if (!_focus.hasPrimaryFocus) {
        // _focus.unfocus();
      }

      return false;
    }

    void _registerUserInfo() async {
      _dismissInput();

      if (_username.isEmpty ||
          _occupation.isEmpty ||
          _institutionName.isEmpty ||
          _institutionType.isEmpty ||
          _typeOfUser.isEmpty ||
          _countrySelected.isEmpty) {
        await showDialog<Widget>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text("error",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 14, color: Colors.redAccent)),
                    content: Text("fill all fields to continue",
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

        await mainBloc.setUpUserForAppAndOnline(
          username: _username,
          country: _countrySelected,
          typeOfUser: _typeOfUser,
          occupation: _occupation,
          profileImage: _profileImage != null
              ? _profileImage.path
              : "lib/Resources/Icons/lawyer.png",
          institutionName: _institutionName,
          typeOfInstitution: _institutionType,
          levelInInstitution: _levelInInstitution,
        );

        setState(() => _isLoading = false);

        await Navigator.push(context,
            MaterialPageRoute<Widget>(builder: (context) => LegalAuthority()));
      }
    }

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(children: [
              NotificationListener(
                onNotification: (dynamic t) => _onScroll(t),
                child: ListView(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("USER REGISTRATION",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        fontSize: 20,
                                        color: Theme.of(context).accentColor)),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                child: Icon(Icons.edit,
                                    size: 16,
                                    color: Theme.of(context).buttonColor))
                          ])),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Username",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 15)),
                            SizedBox(height: 20),
                            RussTextField(
                                hintText: "Username",
                                onChange: (String value) =>
                                    setState(() => _username = value)),
                            SizedBox(height: 50),
                            Text("Profile",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 15)),
                            SizedBox(height: 20),
                            Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(_profileImage != null
                                            ? _profileImage.path
                                            : "lib/Resources/Icons/lawyer.png")),
                                    color: Theme.of(context).accentColor),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                          onTap: () =>
                                              _pickImage(ImageSource.camera),
                                          child: Container(
                                              height: 40,
                                              width: 42,
                                              color:
                                                  Theme.of(context).buttonColor,
                                              child: Icon(Icons.camera,
                                                  color: Theme.of(context)
                                                      .primaryColor))),
                                      GestureDetector(
                                          onTap: () =>
                                              _pickImage(ImageSource.gallery),
                                          child: Container(
                                              height: 40,
                                              width: 42,
                                              color:
                                                  Theme.of(context).buttonColor,
                                              child: Icon(Icons.image,
                                                  color: Theme.of(context)
                                                      .primaryColor)))
                                    ])),
                            SizedBox(height: 80),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Occupation :",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(fontSize: 15)),
                                  RussDropDown(
                                      onChanged: (int value) =>
                                          _selectOccupation(value),
                                      value: _selectedOccupation,
                                      items: _occupations)
                                ]),
                            SizedBox(height: 50),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Institution :",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(fontSize: 15)),
                                  RussDropDown(
                                      onChanged: (int value) =>
                                          _selectInstitutionType(value),
                                      value: _selectedInstitution,
                                      items: _institutions)
                                ]),
                            SizedBox(height: 50),
                            RussTextField(
                                hintText:
                                    "Name of Institution...eg. University of Calabar",
                                onChange: (String value) =>
                                    setState(() => _institutionName = value)),
                            SizedBox(height: 50),
                            RussTextField(
                                hintText: "level in Institution...eg. 500lvl",
                                onChange: (String value) => setState(
                                    () => _levelInInstitution = value)),
                            SizedBox(height: 60),
                            RichText(
                                text: TextSpan(
                                    children: [
                                  TextSpan(text: "Choose Country:   "),
                                  TextSpan(
                                      text: _countrySelected,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .buttonColor))
                                ],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 15))),
                            SizedBox(height: 20),
                            Flag.grid(onCountrySelected: _newCountrySelected)
                          ])),
                  SizedBox(height: 300),
                  SignInUpButton(text: "FINISH", onPressed: _registerUserInfo)
                ]),
              ),
              Offstage(
                  offstage: !_isLoading,
                  child: Container(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      child: Center(
                          child: SpinKitFoldingCube(
                              size: 70, color: Theme.of(context).buttonColor))))
            ])));
  }
}

class RussDropDown extends StatelessWidget {
  final Function onChanged;
  final int value;
  final List<DropdownMenuItem<int>> items;

  const RussDropDown({this.onChanged, this.value, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).accentColor),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
                dropdownColor: Theme.of(context).primaryColor,
                value: value,
                onChanged: (int value) => onChanged,
                items: items)));
  }
}
