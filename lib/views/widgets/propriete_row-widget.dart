import 'package:flutter/material.dart';
import 'package:mincha/utils/appTheme.dart';
import 'package:mincha/utils/navigation_service.dart';

class ProprieteRowWidget extends StatefulWidget {
  final String urlImageContenaire;
  const ProprieteRowWidget({super.key, required this.urlImageContenaire});

  @override
  State<ProprieteRowWidget> createState() => _ProprieteRowWidgetState();
}

class _ProprieteRowWidgetState extends State<ProprieteRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 100,
        width: width(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 20, // Increased blur radius
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: (width(context) / 3.5) - 5,
              width: (width(context) / 3.5) - 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage(widget.urlImageContenaire),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maison 2 chambres salon',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      'Abidjan, Cocody',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.bedroom_child_rounded,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3')
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bathtub,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3')
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(width: 5,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                       
                children: [
                   Icon(
                     Icons.favorite,
                     color: AppTheme.color.primaryColor,
                   ),
                  Text(
                    'Maison x piece',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.color.primaryColor,
                    ),
                  ),Text(
                        '90 000 FCFA',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.color.primaryColor,
                        ),
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
