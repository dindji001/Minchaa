import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RdvPage extends StatelessWidget {
  const RdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Mes Rredez-vous',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),);
  }
}