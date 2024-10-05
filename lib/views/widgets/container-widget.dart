import 'package:flutter/material.dart';

import '../../utils/appTheme.dart';
import '../../utils/navigation_service.dart';

class ContenaireWidget extends StatefulWidget {
  final String urlImageContenaire;
  final String nomImageContenaire;
  final Widget urlNextPageContenaire;
  const ContenaireWidget({
    super.key,
    required this.urlImageContenaire,
    required this.nomImageContenaire,
    required this.urlNextPageContenaire,
  });

  @override
  State<ContenaireWidget> createState() => _ContenaireWidgetState();
}

class _ContenaireWidgetState extends State<ContenaireWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          routeAnimation(context, widget.urlNextPageContenaire);
        },
        child: Container(
          width: width(context),
          decoration: BoxDecoration(
            color: AppTheme.color.whithColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(157, 211, 209, 209),
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.urlImageContenaire),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.nomImageContenaire,
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
