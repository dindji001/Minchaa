import 'package:flutter/material.dart';

import '../../widgets/setting.dart';

class ParametrePage extends StatelessWidget {
  const ParametrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Paramètres',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(child: SettingPageWidget()),
    );
  }
}
