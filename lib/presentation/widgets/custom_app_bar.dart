// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Container(
          color: Color(0xFF1C1C1C),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
