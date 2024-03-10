import 'package:chat_app/screens/chat/chat_viewmodel.dart';
import 'package:chat_app/screens/core_screen.dart';
import 'package:chat_app/screens/home/home_viewmodel.dart';
import 'package:chat_app/screens/settings/settings_view.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:chat_app/screens/auth/auth_viewmodel.dart';
import 'package:chat_app/screens/auth/logIn_view.dart';
import 'package:chat_app/screens/auth/register_page.dart';
import 'package:chat_app/screens/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => ChatViewModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            routes: {
              '/register': (context) => RegisterView(),
              '/logIn': (context) => LogInView(),
              '/home': (context) => HomeView(),
              '/settings':(context) => SettingsView(),
            },
            debugShowCheckedModeBanner: false,
            home: CoreView(),
            theme: themeProvider.themeData,
          );
        },
      ),
    );
  }
}
