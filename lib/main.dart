import 'package:chat_app/screens/core_screen.dart';
import 'package:chat_app/screens/home_screen/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:chat_app/screens/auth_screens/auth_viewmodel.dart';
import 'package:chat_app/screens/auth_screens/logIn_view.dart';
import 'package:chat_app/screens/auth_screens/register_page.dart';
import 'package:chat_app/screens/home_screen/home_view.dart';

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
        ChangeNotifierProvider(create: (context) => HomeViewModel())
      ],
      child: MaterialApp(
        routes: {
          '/register': (context) => RegisterView(),
          '/logIn': (context) => LogInView(),
          '/home': (context) => HomeView(),
        },
        debugShowCheckedModeBanner: false,
        home: CoreView()
      ),
    );
  }
}
