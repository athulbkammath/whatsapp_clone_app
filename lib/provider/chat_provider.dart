import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/user.dart';

class ChatProvider with ChangeNotifier {
  bool _isActive = true;

  List<User> _users = [];

  List<User> get users => _users;

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }

  Future<void> loadUsers() async {
    final data = await rootBundle.loadString('assets/data/user.json');
    final List<dynamic> jsonData = json.decode(data);
    _users = jsonData.map((json) => User.fromJson(json)).toList();
    if (_isActive) {
      notifyListeners();
    }
  }
}
