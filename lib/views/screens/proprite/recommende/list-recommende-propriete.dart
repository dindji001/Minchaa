import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/appTheme.dart';

class ListRecommadePropriete extends StatelessWidget {
  const ListRecommadePropriete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text(
          "La liste des propriete recommandé",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
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
      ),);
  }
}