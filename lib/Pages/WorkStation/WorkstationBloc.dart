import 'package:flutter/material.dart';

class WorkstationBloc extends ChangeNotifier {
  Map<String, Map> _core_library = {};

  Map get library => _core_library;
}
