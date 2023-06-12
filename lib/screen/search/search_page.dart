import 'package:flutter/material.dart';

import '../../config/constant/app_sizes.dart';
import '../../config/constant/app_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Text('this is Search page',
              style: appStyle(
                Sizes.p32,
                Colors.black,
                FontWeight.bold,
              ),),),
    );
  }
}