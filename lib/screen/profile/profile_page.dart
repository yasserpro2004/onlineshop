import 'package:flutter/material.dart';

import '../../config/constant/app_sizes.dart';
import '../../config/constant/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'this is Profile page',
          style: appStyle(
            Sizes.p32,
            Colors.black,
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
