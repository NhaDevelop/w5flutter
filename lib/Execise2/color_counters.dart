import 'package:flutter/foundation.dart';

class ColorCounters extends ChangeNotifier {
  int _redTapCount = 0;
  int _blueTapCount = 0;

  int get redTapCount => _redTapCount;
  int get blueTapCount => _blueTapCount;

  void incrementRed() {
    _redTapCount++;
    notifyListeners();
  }

  void incrementBlue() {
    _blueTapCount++;
    notifyListeners();
  }
}
