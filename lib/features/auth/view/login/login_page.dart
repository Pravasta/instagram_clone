import 'package:flutter/material.dart';
import 'section/bottom_login_section.dart';
import 'section/field_login_section.dart';
import 'section/header_login_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderLoginSection(),
                FieldLoginSection(),
                BottomLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
