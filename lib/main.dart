import 'package:flutter/material.dart';
import 'package:onlineshop/databases/hive_database.dart';
import 'package:onlineshop/provider/providers.dart';
import 'package:onlineshop/screen/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveDatabase.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DataProvider()),
      ChangeNotifierProvider(create: (context) => CartNotifier()),
      ChangeNotifierProvider(create: (context) => WishlistNotifier()),
      ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
      ChangeNotifierProvider(create: (context) => PageIndicator()),
    ],
    child: MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ),
  ));
}
