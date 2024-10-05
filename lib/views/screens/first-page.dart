import 'package:flutter/material.dart';

import '../../utils/appTheme.dart';
import '../../utils/navigation_service.dart';
import '../widgets/button.dart';
import 'presentation-app-section/caroussel-page-presentation.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height(context),
            width: width(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppTheme.asset.couverture,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: height(context),
            width: width(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [
                  0,
                  1,
                ],
                colors: [
                  Color.fromARGB(100, 0, 0, 0),
                  AppTheme.color.primaryColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 48,
                              color: AppTheme.color.whithColor,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: 'Bienvenu sur '),
                            TextSpan(
                              text: ' MINCHA',
                              style: TextStyle(
                                color: AppTheme.color.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: AppTheme.color.whithColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Découvrez une nouvelle façon de gérer votre bien immobiler avec ',
                            ),
                            TextSpan(
                              text: 'MINCHA',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CButton(
                        title: 'Commencer',
                        sizeTitle: 14,
                        color: AppTheme.color.secondaryColor,
                        onPressed: () {
                          routeAnimation(context,  CarrouselPage());
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
