import 'package:flutter/material.dart';

import 'section/bottom_register_section.dart';
import 'section/field_register_section.dart';
import 'section/header_register_section.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                HeaderRegisterSection(),
                FieldRegisterSection(),
                BottomRegisterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
