import 'package:flutter/material.dart';

class LecturesBloc extends ChangeNotifier {
  LecturesBloc() {
    _init_courses();
  }

  Map<String, Map> _core_lectures = {
    "recentLessons": <String, dynamic>{
      "Relevancy": <String, dynamic>{
        "course": "Evidence",
        "description": "",
        "topics": <String, dynamic>{
          "the size of the universe": //? each topic is bolded as a sub header in the noteview
              "the universe is a grand stage. its size is roughly 1/inifinty * 12 cubic metres",
          "the age of the universe": "kinda the same thing to be honest"
        },
        "examination": <String, dynamic>{
          "what is the size of the universe?": <String, dynamic>{
            "hint": "",
            "answers": <String, Map>{
              "3/.14 x over b right..": <String, bool>{
                "isCorrect": false,
                "isChosen": false
              },
              "1/inifinty * 12 cubic metres": <String, bool>{
                "isCorrect": true,
                "isChosen": false
              },
              "pshhh..i dunno": <String, bool>{
                "isCorrect": false,
                "isChosen": false
              },
            },
          },
          "who the fuck am i?": <String, dynamic>{
            "hint": "",
            "answers": <String, Map>{
              "first*": <String, bool>{"isCorrect": true, "isChosen": false},
              "second*": <String, bool>{"isCorrect": false, "isChosen": false},
            },
          }
        },
        "isSavedToLibrary": false,
      },
      "Proof": <String, dynamic>{
        "course": "Evidence",
        "description": "",
        "topics": <String, dynamic>{
          "the size of the universe": //? each topic is bolded as a sub header in the noteview
              "the universe is a grand stage. its size is roughly 1/inifinty * 12 cubic metres",
          "the age of the universe": "kinda the same thing to be honest"
        },
        "examination": <String, dynamic>{},
        "isSavedToLibrary": false,
      },
      "The nature an development of international law": <String, dynamic>{
        "course": "International",
        "description": "",
        "topics": <String, dynamic>{
          "the size of the universe": //? each topic is bolded as a sub header in the noteview
              "the universe is a grand stage. its size is roughly 1/inifinty * 12 cubic metres",
          "the age of the universe": "kinda the same thing to be honest"
        },
        "examination": <String, dynamic>{},
        "isSavedToLibrary": false,
      },
      "sources": <String, dynamic>{
        "course": "International",
        "description": "",
        "topics": <String, dynamic>{
          "the size of the universe": //? each topic is bolded as a sub header in the noteview
              "the universe is a grand stage. its size is roughly 1/inifinty * 12 cubic metres",
          "the age of the universe": "kinda the same thing to be honest"
        },
        "examination": <String, dynamic>{},
        "isSavedToLibrary": false,
      },
    },
    "recentTests": <String, dynamic>{},
    "courses": <String, Map>{
      "Common Law": <String, dynamic>{
        "lessons": <String, Map>{
          "Introduction": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{
              "the size of the universe": //? each topic is bolded as a sub header in the noteview
                  "the universe is a grand stage. its size is roughly 1/inifinty * 12 cubic metres",
              "the age of the universe": "kinda the same thing to be honest"
            },
            "examination": <String, dynamic>{
              "What is Common Law": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "Laws made by Parliament": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "Laws made by the Courts": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "Laws made by the Government": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
              "A Precedent Law": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "oversees an agency": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "is based on customs": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "is determined by a court case": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "is made by legislature": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
              "local laws passed by councils are called": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "propositions": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "qualification": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "ratifications": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "ordinances": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                },
              },
              "laws passed by legislatures are called": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "edicts": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "statutory law": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "ordinances": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
              "The exclusive right granted to an investor to manufacture, use, or sell an invention is a(n)":
                  <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "copyright": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "trade secret": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "patent": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "trademark": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
              "________ protects the name and identifying symbol of a product or comapny.":
                  <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "copyright": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "trade secret": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "patent": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "trademark": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                },
              },
              "A business organisation that has members is a(n)________.":
                  <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "LLC": <String, bool>{"isCorrect": true, "isChosen": false},
                  "corporation": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "partnership": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "sole proprietorship": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
              "The Supreme Court hears cases that involve ________.":
                  <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "Tort cases": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "corporation": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "Civil cases": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "Constitutional cases": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "Criminal cases": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
            },
            "isSavedToLibrary": false,
          },
        },
        "isSavedToLibrary": false,
      },
      "Evidence": <String, dynamic>{
        "lessons": <String, Map>{
          "Relevancy": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{
              "the size of the universe": //? each topic is bolded as a sub header in the noteview
                  "the universe is a grand stage. its size is roughly 1/inifinty * 12 cubic metres",
              "the age of the universe": "kinda the same thing to be honest"
            },
            "examination": <String, dynamic>{
              "what is the size of the universe?": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "3/.14 x over b right..": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                  "1/inifinty * 12 cubic metres": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "pshhh..i dunno": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
              "who the fuck am i?": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "first*": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "second*": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              }
            },
            "isSavedToLibrary": false,
          },
          "Proof": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{},
            "examination": <String, dynamic>{
              "proof question 1": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "answer*": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                }
              },
            },
            "isSavedToLibrary": false,
          },
          "Documents": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{},
            "examination": <String, dynamic>{},
            "isSavedToLibrary": false,
          },
          "Production and Effect of Evidence": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{},
            "examination": <String, dynamic>{},
            "isSavedToLibrary": false,
          },
          "Witnesses": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{},
            "examination": <String, dynamic>{},
            "isSavedToLibrary": false,
          }
        },
        "isSavedToLibrary": false,
      },
      "Taxation": <String, dynamic>{
        "lessons": <String, Map>{},
        "isSavedToLibrary": false,
      },
      "Criminal": <String, dynamic>{
        "lessons": <String, Map>{},
        "isSavedToLibrary": false,
      },
      "Company": <String, dynamic>{
        "lessons": <String, Map>{},
        "isSavedToLibrary": false,
      },
      "Property": <String, dynamic>{
        "lessons": <String, Map>{},
        "isSavedToLibrary": false,
      },
      "Land": <String, dynamic>{
        "lessons": <String, Map>{},
        "isSavedToLibrary": false,
      },
      "International": <String, dynamic>{
        "lessons": <String, Map>{
          "The nature an development of international law": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{
              "law and politics in the world community": <String, dynamic>{},
              "the role of force in the international system":
                  <String, dynamic>{},
              "the function of politics": <String, dynamic>{},
              "historical development": <String, dynamic>{
                "early origins": <String, dynamic>{},
                "the middle and the renaissance": <String, dynamic>{},
                "the founders of modern international law": <String, dynamic>{},
                "positivisim and naturalism": <String, dynamic>{},
                "the nineteenth century": <String, dynamic>{},
                "the twentieth century": <String, dynamic>{},
                "communist approaches to international law":
                    <String, dynamic>{},
                "the third world": <String, dynamic>{},
              },
            },
            "examination": <String, Map>{
              "question 1*": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "first*": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "second*": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
            },
            "isSavedToLibrary": false,
          },
          "international law today": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{
              "the expanding legal scope of international concern":
                  <String, dynamic>{},
              "modern theories and interpretations": <String, dynamic>{
                "positive law and natural law": <String, dynamic>{},
                "new approaches ": <String, dynamic>{},
              }
            },
            "examination": <String, Map>{
              "question 1*": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "first*": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "second*": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
            },
            "isSavedToLibrary": false,
          },
          "sources": <String, dynamic>{
            "description": "",
            "topics": <String, dynamic>{
              "custom": <String, dynamic>{
                "introduction": <String, dynamic>{},
                "the material fact": <String, dynamic>{},
                "what is state practise?": <String, dynamic>{},
                "opinio juris": <String, dynamic>{},
                "protest, acquiescence and change in customary law":
                    <String, dynamic>{},
                "regional and local custom": <String, dynamic>{},
              },
              "treaties": <String, dynamic>{},
            },
            "examination": <String, Map>{
              "question 1*": <String, dynamic>{
                "hint": "",
                "answers": <String, Map>{
                  "first*": <String, bool>{
                    "isCorrect": true,
                    "isChosen": false
                  },
                  "second*": <String, bool>{
                    "isCorrect": false,
                    "isChosen": false
                  },
                },
              },
            },
            "isSavedToLibrary": false,
          },
        },
        "isSavedToLibrary": true,
      }
    }
  };

  List<String> get letters => [
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z",
      ];

  Map get courses => _core_lectures["courses"];

  Map get recentLessons => _core_lectures["recentLessons"];

  Map get recentTests => _core_lectures["recentTests"];

  void _init_courses() {}

  void addToLibrary({String course, String lesson}) {
    if (lesson == null) {
      _core_lectures["courses"][course]["isSavedToLibrary"] = true;

      _core_lectures["courses"][course]["lessons"]
          .forEach((String key, dynamic value) {
        value["isSavedToLibrary"] = true;
      });
    } else {
      _core_lectures["courses"][course]["lessons"][lesson]["isSavedToLibrary"] =
          true;
    }

    notifyListeners();
  }

  void removeFromLibrary({String course, String lesson}) {
    if (lesson == null) {
      _core_lectures["courses"][course]["isSavedToLibrary"] = false;

      _core_lectures["courses"][course]["lessons"]
          .forEach((String key, dynamic value) {
        value["isSavedToLibrary"] = false;
      });
    } else {
      _core_lectures["courses"][course]["lessons"][lesson]["isSavedToLibrary"] =
          false;
    }
    notifyListeners();
  }

  void toggleSaveCourse({String course, bool currentSaveStateOfItem}) {
    if (currentSaveStateOfItem) {
      removeFromLibrary(course: course);
    } else {
      addToLibrary(course: course);
    }
  }

  void toggleSaveLesson(
      {String course, String lesson, bool currentSaveStateOfItem}) {
    if (currentSaveStateOfItem) {
      removeFromLibrary(course: course, lesson: lesson);
    } else {
      addToLibrary(course: course, lesson: lesson);
    }
  }

  void updateRecentLessons({String course, String lesson}) {
    _core_lectures["courses"][course]["lessons"]
        .forEach((String key, dynamic value) {
      if (key == lesson) {
        Map kage = <dynamic, dynamic>{};

        kage.addAll(<String, String>{"course": course});
        kage.addAll(value as Map);

        _core_lectures["recentLessons"][lesson] = kage;

        //todo: add value to the top of map...
      }
    });

    //todo: remove last entries...limit list to 12..
  }

  void updateRecentVideoLessons({String course, String lesson}) {}

  void updateRecentTests({String course, String lesson}) {
    print(lesson);
  }
}
