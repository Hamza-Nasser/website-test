import 'package:flutter/material.dart';
import 'package:website_test/presentation/screens/whole/sections/first.dart';

class WholeScreen extends StatefulWidget {
  const WholeScreen({super.key});

  @override
  State<WholeScreen> createState() => _WholeScreenState();
}

class _WholeScreenState extends State<WholeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstSection(),
          ],
        ),
      ),
    );
  }
}
