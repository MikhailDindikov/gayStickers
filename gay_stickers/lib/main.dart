import 'dart:async';

import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gay_stickers/gay_srceens/main_gay_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: 'app_GdpkKz8S4buDPoPJoBFz8CZxY3SCfx');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyGayApp());
}

class MyGayApp extends StatelessWidget {
  const MyGayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gay Stickers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainGayScreen(),
    );
  }
}
