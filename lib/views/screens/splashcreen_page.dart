import 'package:flutter/material.dart';

import '../../utils/appTheme.dart';
import '../../utils/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppTheme.colors.blackColor,
        body: Center(
      child: Image.asset(
        AppTheme.asset.logo2,
        width: width(context) * 0.5,
      ),
      // ProgressBarDemo()
    ));
  }
}
