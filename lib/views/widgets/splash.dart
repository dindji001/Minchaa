import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/navigation_service.dart';
import '../screens/first-page.dart';



class SplashWidget extends StatefulWidget {
  const SplashWidget({
    super.key,
    this.time = 2,
    required this.child,
    required FirstPage nextPage,
  });
  final int time;
  final Widget child;

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: widget.time), () {
      route(context, const FirstPage(), close: true);
    });
    return widget.child;
  }
}
