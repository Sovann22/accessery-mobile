import 'package:flutter/material.dart';
import '../utils/logger.dart';

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
      logger.info('Sign in attempt started', tag: 'AUTH');
      logger.userAction('sign_in_attempt', data: {'email': email});

      _isLoading = true;
      notifyListeners();

      // Simulate network delay
      final stopwatch = Stopwatch()..start();
      await Future.delayed(const Duration(seconds: 1));
      stopwatch.stop();

      logger.performance(
        'sign_in_network_call',
        stopwatch.elapsed,
        tag: 'AUTH',
      );

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

        logger.info('Sign in successful', tag: 'AUTH');
        logger.userAction(
          'sign_in_success',
          data: {'user_id': _user!.id, 'email': _user!.email},
        );

        notifyListeners();
        return true;
      } else {
        logger.warning('Sign in failed - Invalid credentials', tag: 'AUTH');
        logger.userAction(
          'sign_in_failed',
          data: {'email': email, 'reason': 'invalid_credentials'},
        );
        return false;
      }
    } catch (e, stackTrace) {
      logger.error(
        'Sign in error occurred',
        tag: 'AUTH',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
      logger.debug('Sign in process completed', tag: 'AUTH');
    }
  }

  Future<bool> signUp(String email, String password, String name) async {
    try {
      logger.info('Sign up attempt started', tag: 'AUTH');
      logger.userAction(
        'sign_up_attempt',
        data: {'email': email, 'name': name},
      );

      _isLoading = true;
      notifyListeners();

      // Simulate network delay
      final stopwatch = Stopwatch()..start();
      await Future.delayed(const Duration(seconds: 1));
      stopwatch.stop();

      logger.performance(
        'sign_up_network_call',
        stopwatch.elapsed,
        tag: 'AUTH',
      );

      // Check if user already exists
      final existingUser = _mockUsers.any((user) => user['email'] == email);
      if (existingUser) {
        logger.warning('Sign up failed - User already exists', tag: 'AUTH');
        logger.userAction(
          'sign_up_failed',
          data: {'email': email, 'reason': 'user_exists'},
        );
        return false;
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

      logger.info('Sign up successful', tag: 'AUTH');
      logger.userAction(
        'sign_up_success',
        data: {
          'user_id': _user!.id,
          'email': _user!.email,
          'name': _user!.displayName,
        },
      );

      notifyListeners();
      return true;
    } catch (e, stackTrace) {
      logger.error(
        'Sign up error occurred',
        tag: 'AUTH',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
      logger.debug('Sign up process completed', tag: 'AUTH');
    }
  }

  Future<void> signOut() async {
    try {
      logger.info('Sign out started', tag: 'AUTH');
      logger.userAction('sign_out', data: {'user_id': _user?.id});

      _user = null;
      notifyListeners();

      logger.info('Sign out completed successfully', tag: 'AUTH');
    } catch (e, stackTrace) {
      logger.error(
        'Sign out error occurred',
        tag: 'AUTH',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      logger.info('Password reset requested', tag: 'AUTH');
      logger.userAction('password_reset_request', data: {'email': email});

      // Mock password reset - just simulate delay
      await Future.delayed(const Duration(seconds: 1));

      logger.info('Password reset email sent (mock)', tag: 'AUTH');
    } catch (e, stackTrace) {
      logger.error(
        'Password reset error occurred',
        tag: 'AUTH',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
