import 'package:flutter/material.dart';

import '../../utils/appTheme.dart';
class CButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? color;
  final Color? sideColor;
  final double raduis, height, width, sideWidth, sizeTitle;
  final VoidCallback? onPressed;

  const CButton({
    super.key,
    required this.title,
    this.titleColor,
    this.color,
    this.raduis = 10,
    this.height = 55,
    this.width = 345,
    required this.onPressed,
    this.sideWidth = 0,
    this.sideColor,
    this.sizeTitle = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontSize: sizeTitle,
            // titleColor ?? Config.colors.secondaryColor
            color: titleColor ?? AppTheme.color.whithColor),
      ),
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(Size(width, height)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis),
            side: BorderSide(
              width: sideWidth,
              color: sideColor ?? AppTheme.color.whithColor,
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? AppTheme.color.primaryColor,
        ), //verifier si la couleur est nul (si oui alors on lui donne la couleur pas defaut)
      ),
    );
  }
}
