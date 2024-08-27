// ignore_for_file: prefer_const_constructors

import 'package:auth_ui/main.dart';
import 'package:auth_ui/presentation/pages/profile/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF1C1C1C),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
