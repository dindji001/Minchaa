import 'package:flutter/material.dart';

route(context, widget, {bool close = false}) => close
    ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => widget), (route) => false)
    : Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => widget),
      );

routeAnimation(context, widget) => Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 200),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        },
      ),
    );

width(context) => MediaQuery.of(context).size.width;
height(context) => MediaQuery.of(context).size.height;
