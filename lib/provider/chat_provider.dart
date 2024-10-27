import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/user.dart';

class ChatProvider with ChangeNotifier {
  bool _isActive = true;

  List<User> _users = [];

  List<User> _filteredUsers = [];

  final List<String> _chips = ["All", "Unread", "Favourites", "Groups"];

  String _selectedChip = "All";

  List<User> get users => _filteredUsers.isNotEmpty ? _filteredUsers : _users;

  String get selectedChip => _selectedChip;

  List<String> get chips => _chips;

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }

  void setSelectedChip(String chip) {
    _selectedChip = chip;
    if (_isActive) {
      notifyListeners();
    }
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      _filteredUsers = [];
    } else {
      _filteredUsers = _users.where((user) {
        return user.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
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
