import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/LawsAndDocs/Constitutions/Constitutions.dart';
import 'package:legal_authority/Pages/LawsAndDocs/InternationalLaw/InternationalLaw.dart';
import 'package:legal_authority/Pages/LawsAndDocs/ActsOfTheFederation/ActsOfTheFederation.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsAndDocsBloc.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawsOfTheVariousStates/LawsOfTheVariousStates.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LegalDrafting/LegalDrafting.dart';
import 'package:legal_authority/Pages/LawsAndDocs/MilitaryDecreesAndEdicts/MilitaryDecreesAndEdicts.dart';
import 'package:legal_authority/Pages/LawsAndDocs/PrinciplesAndCases/PrinciplesAndCases.dart';
import 'package:legal_authority/Pages/LawsAndDocs/RulesOfCourt/RulesOfCourt.dart';
import 'package:legal_authority/Pages/LawsAndDocs/LawReports/LawReports.dart';
import 'package:legal_authority/Widgets/Dumb/Flag.dart';
import 'package:legal_authority/Widgets/Functional/PageHeader.dart';
import 'package:legal_authority/Widgets/Functional/Panel.dart';
import 'package:provider/provider.dart';

class LawsAndDocs extends StatelessWidget {
  final Function openSidebar;

  LawsAndDocs({this.openSidebar});

  List<String> _panels = [
    "Acts Of The Federation",
    "Constitutions",
    "Law Reports",
    "Laws Of The Various States",
    "Rules Of Court",
    "Military Decrees And Edicts",
    "International Laws",
    "Principles And Cases",
    "Legal Drafting",
  ];

  @override
  Widget build(BuildContext context) {
    LawsAndDocsBloc lawsAndDocsBloc = Provider.of<LawsAndDocsBloc>(context);

    void _changeCountry() {
      showModalBottomSheet<Widget>(
        context: context,
        builder: (ctx) {
          return CountryList();
        },
        // enableDrag: false,
        // isScrollControlled: true,
      );
    }

    void _openPage(String name) {
      Navigator.push(context, MaterialPageRoute<Widget>(builder: (context) {
        switch (name) {
          case "Constitutions":
            return Constitutions(title: name);
            break;

          case "Acts Of The Federation":
            return ActsOfTheFederation(title: name);
            break;

          case "Law Reports":
            return LawReports(title: name);
            break;

          case "Laws Of The Various States":
            return LawsOfTheVariousStates(title: name);
            break;

          case "Rules Of Court":
            return RulesOfCourt(title: name);
            break;

          case "International Law":
            return InternationalLaw(title: name);
            break;

          case "Principles and Cases":
            return PrinciplesAndCases(title: name);
            break;

          case "Military Decrees and Edicts":
            return MilitaryDecreesAndEdicts(title: name);
            break;

          case "Legal Drafting":
            return LegalDrafting(title: name);
            break;
        }
        return Text("Error");
      }));
    }

    Map<String, dynamic> _getFacts(String title) {
      Map<String, dynamic> x = <String, dynamic>{};

      switch (title) {
        case "Acts Of The Federation":
          x["books"] = lawsAndDocsBloc.aotf["substantive"].length +
              lawsAndDocsBloc.aotf["procedural"].length +
              lawsAndDocsBloc.aotf["amendments"].length;

          x["S"] = lawsAndDocsBloc.aotf["substantive"].length;

          x["P"] = lawsAndDocsBloc.aotf["procedural"].length;

          x["A"] = lawsAndDocsBloc.aotf["amendments"].length;

          return x;

          break;

        default:
          return x;
      }
    }

    return Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: FloatingActionButton.extended(
                onPressed: _changeCountry,
                backgroundColor: Theme.of(context).buttonColor,
                label: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("change country",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Theme.of(context).primaryColor)),
                      SizedBox(width: 10),
                      Flag(
                          height: 30,
                          width: 50,
                          country: "Nigeria",
                          showLabel: false)
                    ]))),
        body: CustomScrollView(slivers: [
          PageHeader.sliver(
            title: "LAWS AND DOCS",
            icon: Icons.gavel_rounded,
            onLeadingIconTapped: openSidebar,
            // endWidget: Padding(
            //     padding: const EdgeInsets.only(right: 25),
            //     child: InkWell(
            //         onTap: _changeCountry,
            //         child: Flag(
            //             width: 40,
            //             height: 30,
            //             showLabel: false,
            //             country: "Nigeria",
            //             labelColor: Colors.white)))
          ),
          SliverPadding(
              padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
              sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 25,
                  children: _panels
                      .map((String e) => Panel(
                          facts: _getFacts(e), title: e, openPage: _openPage))
                      .toList()))
        ]));
  }
}

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
