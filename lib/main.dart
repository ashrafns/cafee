import 'package:cafee/Provider/favorite_provider.dart';
import 'package:cafee/Provider/quantity.dart';
import 'package:cafee/app_main_screen.dart';
import 'package:cafee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => QuantityProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AppMainScreen(),
      ),
    );
  }
}
