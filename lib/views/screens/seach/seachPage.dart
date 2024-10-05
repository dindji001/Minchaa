import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/appTheme.dart';

class SeachPage extends StatelessWidget {
  const SeachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.2,
                  color: AppTheme.color.secondaryColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  AppTheme.assetSvg.sliders,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Rechercher',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(
          color: AppTheme.color.whithColor,
        ),
        backgroundColor: AppTheme.color.whithColor,
      ),
      body: Center(
        child: Text('SEACHE PAGE'),
      ),
    );
  }
}
