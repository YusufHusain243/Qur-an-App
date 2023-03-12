import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: ListView(
            children: [
              Appbar(),
            ],
          ),
        ),
      ),
    );
  }
}
