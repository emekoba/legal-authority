import 'package:flutter/material.dart';
import 'package:legal_authority/Pages/Library/LibraryBloc.dart';

class LawsAndDocsBloc extends ChangeNotifier {
  Map<String, Map> _core_lawsAndDocs = {
    "aotf": <String, Map>{
      "substantive": <String, Map>{
        "Acts Authentication Act": <String, dynamic>{
          "tags": <String>["company"],
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background2.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Administration Of Justice Commission Act": <String, dynamic>{
          "tags": <String>["commercial"],
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background9.png'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Admiralty Jurisdiction Act": <String, dynamic>{
          "tags": <String>["taxation"],
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background10.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Administrative Guidelines For Commissioner For Oaths":
            <String, dynamic>{
          "tags": <String>["taxation"],
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background10.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Administrative Staff College Of Nigeria Act": <String, dynamic>{
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background10.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Advertising Practitioner’s (Registration, Etc.) Act":
            <String, dynamic>{
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background10.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
      },
      "procedural": <String, Map>{
        "Procedural Act": <String, dynamic>{
          "tags": <String>["company"],
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background2.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
      },
      "amendments": <String, Map>{
        "Amendment Act": <String, dynamic>{
          "tags": <String>["company"],
          "cover": AssetImage(
              'lib/Resources/Media/Photos/Background/background2.jpg'),
          "enacted": "1997",
          "description": "create standard for validating recently enacted acts",
          "content": <String, dynamic>{"script": "", "pdf": ""},
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
      },
    },
    "lotvs": <String, Map>{
      "states": <String, Map>{
        "Abuja": <String, Map>{
          "local law": <String, Map>{
            "government legislation of 1974": <String, dynamic>{
              "tags": <String>["company"],
              "cover": AssetImage(
                  'lib/Resources/Media/Photos/Background/background2.jpg'),
              "enacted": "1997",
              "description": "passed in abia state to regulate traders",
              "content": <String, dynamic>{"script": "", "pdf": ""},
              "isSavedToLibrary": false,
              "isSavedToWorkstation": false
            }
          },
          "state law": <String, dynamic>{}
        },
        "Abia": <String, Map>{},
        "Adamawa": <String, Map>{},
        "Akwa Ibom": <String, Map>{},
        "Anambra": <String, Map>{},
        "Bauchi": <String, Map>{},
        "Bayelsa": <String, Map>{},
        "Benue": <String, Map>{},
        "Borno": <String, Map>{},
        "Cross River": <String, Map>{},
        "Delta": <String, Map>{},
        "Ebonyi": <String, Map>{},
        "Edo": <String, Map>{},
        "Ekiti": <String, Map>{},
        "Enugu": <String, Map>{},
        "Gombe": <String, Map>{},
        "Imo": <String, Map>{},
        "Jigawa": <String, Map>{},
        "Kaduna": <String, Map>{},
        "Kano": <String, Map>{},
        "Katsina": <String, Map>{},
        "Kebbi": <String, Map>{},
        "Kogi": <String, Map>{},
        "Kwara": <String, Map>{},
        "Lagos": <String, Map>{},
        "Nassarawa": <String, Map>{},
        "Niger": <String, Map>{},
        "Ogun": <String, Map>{},
        "Ondo": <String, Map>{},
        "Osun": <String, Map>{},
        "Oyo": <String, Map>{},
        "Plateau": <String, Map>{},
        "Rivers": <String, Map>{},
        "Sokoto": <String, Map>{},
        "Taraba": <String, Map>{},
        "Yobe": <String, Map>{},
        "Zamfara": <String, Map>{},
      }
    },
    "constitutions": <String, Map>{
      "Nigeria": <String, Map>{
        "1999": <String, dynamic>{
          "description":
              "The 1999 constitution restored democratic rule to Nigeria, and remains in force today. In January 2011, two amendments of the 1999 constitution were signed by President Olusegun Obasanjo, the first modifications since the document came into use in 1999.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "1993": <String, dynamic>{
          "description":
              "The 1993 constitution was intended to see the return of democratic rule to Nigeria with the establishment of a Third Republic, but was never fully implemented, and the military resumed power until 1999.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "1979": <String, dynamic>{
          "description":
              "The 1979 constitution, which brought in the Second Republic, abandoned the Westminster system in favour of an American-style presidential system, with a direct election, directly-elected.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "1963": <String, dynamic>{
          "description":
              "Nigeria's second constitution established the country as a federal republic. It came into force on 1st of October,1963 (Nigeria's third anniversary as an independent nation). The 1963 constitution, which was based on the Westminster system, continued in operation until a military coup in 1966 overthrew Nigeria's democratic institutions.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "1960": <String, dynamic>{
          "description":
              "Nigeria's first constitution as a sovereign state was enacted by a British order in council so as to come into force immediately upon independence, on 1 October 1960. Under this constitution Nigeria retained Queen Elizabeth II as titular head of state.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Lyttleton (1954)": <String, dynamic>{
          "description":
              "Named for Oliver Lyttelton, 1st Viscount Chandos and enacted in 1954, firmly established the federal principle and paved the way for independence.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Macpherson (1951)": <String, dynamic>{
          "description":
              "By extending the elective principle and by providing for a central government with a Council of Ministers, the Macpherson Constitution gave renewed impetus to party activity and to political participation at the national level.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "Richards (1946)": <String, dynamic>{
          "description":
              "A new constitution was approved by Westminster and promulgated in Nigeria. Although it reserved effective power in the hands of the Governor-General and his appointed Executive Council.",
          "isSavedToLibrary": false,
          "isSavedToWorkstation": false
        },
        "1913": <String, dynamic>{
          "description":
              "Nigeria's first constitution. Enacted by order in council during the colonial era, when the country was administered as a Crown Colony.",
          "isSavedToLibrary": true,
          "isSavedToWorkstation": true
        },
      }
    },
    "lwrprt": <String, Map>{},
    "roc": <String, Map>{
      "customary court of appeal": <String, Map>{},
      "federal court of appeal": <String, Map>{},
      "federal high court": <String, Map>{},
      "high court of each state": <String, Map>{
        "FCT": <String, Map>{},
        "anambra": <String, Map>{}
      },
      "magistrate court": <String, Map>{},
      "national industrial court": <String, Map>{},
      "sharia court of appeal": <String, Map>{},
      "sharia court of northern states": <String, Map>{
        "kaduna": <String, Map>{},
        "maiduguri": <String, Map>{}
      },
      "industrial court": <String, Map>{},
      "tribunals": <String, Map>{},
      "supreme court": <String, Map>{},
    },
    "mdae": <String, Map>{},
    "intl": <String, Map>{},
    "pac": <String, Map>{},
    "lgldrft": <String, Map>{},
  };

  Map get aotf => _core_lawsAndDocs["aotf"];

  Map get lotvs => _core_lawsAndDocs["lotvs"];

  Map get constitutions => _core_lawsAndDocs["constitutions"];

  Map get roc => _core_lawsAndDocs["roc"];

  void addToLibrary(
      {String lawGroup, String country, String tab, String title}) {
    switch (lawGroup) {
      case "constitutions":
        _core_lawsAndDocs[lawGroup][country][tab]["isSavedToLibrary"] = true;
        break;

      case "aotf":
        _core_lawsAndDocs[lawGroup][tab][title]["isSavedToLibrary"] = true;

        break;
      default:
    }

    //todo: add the file to librarybloc from here...
    // LibraryBloc().addToLawsAndDocsLibrary(lawOrDoc: title, lawGroup: lawGroup);

    notifyListeners();
  }

  void removeFromLibrary(
      {String lawGroup, String country, String tab, String title}) {
    switch (lawGroup) {
      case "constitutions":
        _core_lawsAndDocs[lawGroup][country][tab]["isSavedToLibrary"] = false;
        break;

      case "aotf":
        _core_lawsAndDocs[lawGroup][tab][title]["isSavedToLibrary"] = false;
        break;
    }

    notifyListeners();
  }

  void addToWorkstation(
      {String lawGroup, String country, String tab, String title}) {
    switch (lawGroup) {
      case "constitutions":
        _core_lawsAndDocs[lawGroup][country][tab]["isSavedToWorkstation"] =
            true;
        break;

      case "aotf":
        _core_lawsAndDocs[lawGroup][tab][title]["isSavedToWorkstation"] = true;
        break;
    }

    notifyListeners();
  }

  void removeFromWorkstation(
      {String lawGroup, String country, String tab, String title}) {
    switch (lawGroup) {
      case "constitutions":
        _core_lawsAndDocs[lawGroup][country][tab]["isSavedToWorkstation"] =
            false;
        break;

      case "aotf":
        _core_lawsAndDocs[lawGroup][tab][title]["isSavedToWorkstation"] = false;
        break;
    }

    notifyListeners();
  }

  void toggleSaveItem(
      {String saveTo,
      String lawGroup,
      String tab,
      String title,
      String country,
      bool currentSaveStateOfItem}) {
    switch (saveTo) {
      case "library":
        if (currentSaveStateOfItem) {
          removeFromLibrary(
              lawGroup: lawGroup, country: country, tab: tab, title: title);
        } else {
          addToLibrary(
              lawGroup: lawGroup, country: country, tab: tab, title: title);
        }
        break;

      case "workstation":
        if (currentSaveStateOfItem) {
          removeFromWorkstation(
              lawGroup: lawGroup, country: country, tab: tab, title: title);
        } else {
          addToWorkstation(
              lawGroup: lawGroup, country: country, tab: tab, title: title);
        }
        break;
    }
  }
}
