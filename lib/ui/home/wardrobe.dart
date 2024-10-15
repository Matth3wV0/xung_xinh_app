import 'package:flutter/material.dart';

class Wardrobe extends StatelessWidget {
  const Wardrobe({super.key});

  @override
  Widget build(BuildContext context) {
    return const WardorbePage();
  }
}

class WardorbePage extends StatefulWidget {
  const WardorbePage({super.key});

  @override
  State<WardorbePage> createState() => _WardorbePageState();
}

class _WardorbePageState extends State<WardorbePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

