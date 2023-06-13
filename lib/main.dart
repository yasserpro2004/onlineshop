import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop/provider/providers.dart';
import 'package:onlineshop/screen/screens.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
      ChangeNotifierProvider(create: (context) => MenShoesNotifier()),
      ChangeNotifierProvider(create: (context) => WomenShoesNotifier()),
      ChangeNotifierProvider(create: (context) => KidsShoesNotifier()),
      ChangeNotifierProvider(create: (context) => PageIndicator()),
      ChangeNotifierProvider(create: (context) => CartNotifier()),
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
