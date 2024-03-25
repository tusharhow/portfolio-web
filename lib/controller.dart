import 'package:flutter/material.dart';

class PortfolioController extends ChangeNotifier {
  List<bool> isHoverList = List.generate(5, (_) => false);

  void onEnter(int index) {
    isHoverList[index] = true;
    notifyListeners();
  }

  void onExit(int index) {
    isHoverList[index] = false;
    notifyListeners();
  }

  bool isCVHover = false;
  void cvEnter() {
    isCVHover = true;
    notifyListeners();
  }

  void cvExit() {
    isCVHover = false;
    notifyListeners();
  }

  bool isHireMeHover = false;
  void hireMeEnter() {
    isHireMeHover = true;
    notifyListeners();
  }

  void hireMeExit() {
    isHireMeHover = false;
    notifyListeners();
  }

  bool isSocialHover = false;
  void socialEnter() {
    isSocialHover = true;
    notifyListeners();
  }

  void socialExit() {
    isSocialHover = false;
    notifyListeners();
  }
}
