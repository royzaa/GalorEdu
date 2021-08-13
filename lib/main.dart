import 'package:flutter/material.dart';

import './services/sheets_api.dart';
import './interface/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SheetApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galor Education',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Poppins',
      ),
      home: const Home(),
    );
  }
}
