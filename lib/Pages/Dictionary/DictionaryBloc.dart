import 'package:flutter/material.dart';

class DictionaryBloc extends ChangeNotifier {
  DictionaryBloc() {
    _init_wordList();
  }

  Map<String, Map> _core_dictionary = {
    "wordList": <String, dynamic>{
      "Affidavit": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "democratic": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "riot": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "insurrection": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "mutiny": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "forced or compulsory labour": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "Witness Summons": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "Subpoena": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "proviso": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "ab initio": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "ab brovado": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "in loco parentis": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
      "remittances": {
        "language": "latin",
        "phonetics": "",
        "audio": "",
        "tabs": {
          "definitions": ["meaning1", "meaning2"],
          "abbreviations": ["example1", "example2"],
          "usage": ["example1", "example2"]
        },
        "isSavedToLibrary": false,
        "isSavedToWorkstation": false,
      },
    },
  };

  List<String> _core_history = [];

  Map get wordList => _core_dictionary["wordList"];

  List<String> get history => _core_history;

  void _init_wordList() {}

  void addToLibrary(String word) {
    _core_dictionary["wordList"][word]["isSavedToLibrary"] = true;

    notifyListeners();
  }

  void removeFromLibrary(String word) {
    _core_dictionary["wordList"][word]["isSavedToLibrary"] = false;

    notifyListeners();
  }

  void addToWorkstation(String word) {
    _core_dictionary["wordList"][word]["isSavedToWorkstation"] = true;

    notifyListeners();
  }

  void removeFromWorkstation(String word) {
    _core_dictionary["wordList"][word]["isSavedToWorkstation"] = false;

    notifyListeners();
  }

  void toggleSaveItem(String saveTo, String word, bool currentSaveStateOfItem) {
    switch (saveTo) {
      case "library":
        if (currentSaveStateOfItem) {
          removeFromLibrary(word);
        } else {
          addToLibrary(word);
        }
        break;

      case "workstation":
        if (currentSaveStateOfItem) {
          removeFromWorkstation(word);
        } else {
          addToWorkstation(word);
        }
        break;

      default:
    }
  }

  void addWordToHistory(String word) {
    if (!_core_history.contains(word)) {
      _core_history.add(word);
    }
  }
}
