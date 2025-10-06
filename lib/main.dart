import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/player_service.dart';
import 'services/theme_service.dart';
import 'screens/players_list_screen.dart';
import 'theme/app_theme.dart';

void main() {
  // Create PlayerService instance
  final playerService = PlayerService();
  // Add dummy data
  playerService.addDummyPlayers();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: playerService), // Use the instance with dummy data
        ChangeNotifierProvider(create: (_) => ThemeService()),
      ],
      child: const BadmintonQueueApp(),
    ),
  );
}

class BadmintonQueueApp extends StatelessWidget {
  const BadmintonQueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Badminton Queue System',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeService.themeMode,
          debugShowCheckedModeBanner: false,
          home: const PlayersListScreen(),
        );
      },
    );
  }
}
