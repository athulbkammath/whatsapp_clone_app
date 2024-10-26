import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _isActive = true;

  int _selectedIndex = 0;

  final int _tabCount = 4;

  int get selectedIndex => _selectedIndex;

  int get tabCount => _tabCount;

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }

  void setIndex(int index) {
    _selectedIndex = index;
    if (_isActive) {
      notifyListeners();
    }
  }
}
