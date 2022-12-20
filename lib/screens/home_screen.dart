import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(child: Text('WOW HOME'), color: Colors.amber),
    ],);
  }
}
