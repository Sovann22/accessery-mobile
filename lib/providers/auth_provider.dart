import 'package:flutter/material.dart';

class User {
  final String id;
  final String email;
  final String displayName;

  User({required this.id, required this.email, required this.displayName});
}

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  // Mock users database
  final List<Map<String, String>> _mockUsers = [
    {
      'id': '1',
      'email': 'demo@example.com',
      'password': 'password123',
      'name': 'Demo User',
    },
    {
      'id': '2',
      'email': 'john@example.com',
      'password': 'john123',
      'name': 'John Doe',
    },
  ];

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  Future<bool> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Check mock users
      final mockUser = _mockUsers.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );

      if (mockUser.isNotEmpty) {
        _user = User(
          id: mockUser['id']!,
          email: mockUser['email']!,
          displayName: mockUser['name']!,
        );
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      print('Sign in error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signUp(String email, String password, String name) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Check if user already exists
      final existingUser = _mockUsers.any((user) => user['email'] == email);
      if (existingUser) {
        return false; // User already exists
      }

      // Create new user
      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'email': email,
        'password': password,
        'name': name,
      };

      _mockUsers.add(newUser);

      _user = User(
        id: newUser['id']!,
        email: newUser['email']!,
        displayName: newUser['name']!,
      );

      notifyListeners();
      return true;
    } catch (e) {
      print('Sign up error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _user = null;
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    // Mock password reset - just simulate delay
    await Future.delayed(const Duration(seconds: 1));
    // In a real app, this would send a password reset email
  }
}
