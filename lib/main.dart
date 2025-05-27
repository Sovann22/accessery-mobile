import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';
import 'utils/logger.dart';

void main() {
  // Initialize logging
  logger.info('App starting up', tag: 'MAIN');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.debug('Building MyApp widget', tag: 'MAIN');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            logger.debug('Creating AuthProvider', tag: 'MAIN');
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            logger.debug('Creating CartProvider', tag: 'MAIN');
            return CartProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            logger.debug('Creating ThemeProvider', tag: 'MAIN');
            return ThemeProvider();
          },
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          logger.debug('Theme mode: ${themeProvider.themeMode}', tag: 'MAIN');

          return MaterialApp(
            title: 'Phone Accessory Store',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const SplashScreen(),
            routes: {
              '/login': (context) => const LoginScreen(),
              '/home': (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
