import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mincha/utils/appTheme.dart';
import 'package:mincha/utils/navigation_service.dart';
import 'package:mincha/views/widgets/button.dart';

import '../../../viewmodels/home/homeMenuViewModel.dart';
import '../../widgets/propriete-widget.dart';
import '../dinamicMenuHomePage/dinamicMenuHomePage.dart';
import '../notification/notification-page.dart';
import '../proprite/detail-propriete-page.dart';
import '../proprite/new/list-new-propriete.dart';
import '../proprite/recommende/list-recommende-propriete.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final homeMenuViewModel = Get.put(HomeMenuViewModel());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppTheme.asset.logo2),
                          ),
                        ),
                      ),
                      Text(
                        'MINCHA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          routeAnimation(context, NotificationsPage());
                        },
                        child: Stack(
                          children: [
                            SvgPicture.asset(AppTheme.assetSvg.notificationSvg,
                                width: 30),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppTheme.color.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(AppTheme.assetSvg.profilSvg, width: 30),
                    ],
                  )
                ],
              ),
              Container(
                height: 170,
                width: width(context),
                decoration: BoxDecoration(
                    color: AppTheme.color.secondaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: -25,
                      child: Container(
                        width: 280,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppTheme.asset.imagepub),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width(context) - 150,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppTheme.color
                                        .textColor), // Style du texte par défaut
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Confiez nous la',
                                    style: TextStyle(
                                        color: AppTheme.color.whithColor),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Rediriger l'utilisateur vers la page LoginPage
                                      },
                                    text: ' construction',
                                    style: TextStyle(
                                        color: AppTheme.color.primaryColor),
                                  ),
                                  TextSpan(
                                    text: ' de votre',
                                    style: TextStyle(
                                        color: AppTheme.color.whithColor),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Rediriger l'utilisateur vers la page LoginPage
                                      },
                                    text: ' maison',
                                    style: TextStyle(
                                        color: AppTheme.color.primaryColor),
                                  ),
                                  TextSpan(
                                    text: ' de',
                                    style: TextStyle(
                                        color: AppTheme.color.whithColor),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Rediriger l'utilisateur vers la page LoginPage
                                      },
                                    text: ' A',
                                    style: TextStyle(
                                        color: AppTheme.color.primaryColor),
                                  ),
                                  TextSpan(
                                    text: ' à',
                                    style: TextStyle(
                                        color: AppTheme.color.whithColor),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Rediriger l'utilisateur vers la page LoginPage
                                      },
                                    text: ' Z',
                                    style: TextStyle(
                                        color: AppTheme.color.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CButton(
                            title: 'Nous Contacter',
                            onPressed: () {},
                            width: 160,
                            sizeTitle: 12,
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width(context),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Recherche une maison...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.2,
                          color: AppTheme.color.secondaryColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          AppTheme.assetSvg.sliders,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: homeMenuViewModel.menuItems.map((item) {
                      return GestureDetector(
                        onTap: () {
                          route(
                            context,
                            DinamicMenuHomePage(
                              titleAppBar: item,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppTheme.color.primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: AppTheme.color.whithColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nouveau propriete ',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {
                          route(context, ListeNewPropriete());
                        },
                        child: Text(
                          'Voir tous',
                          style: TextStyle(
                            color: AppTheme.color.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ProprieteWidget(),
                        SizedBox(
                          width: 15,
                        ),
                        ProprieteWidget(),
                        SizedBox(
                          width: 15,
                        ),
                        ProprieteWidget(),
                        SizedBox(
                          width: 15,
                        ),
                        ProprieteWidget(),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 35,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Propriete Recommander',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {
                          route(context, ListRecommadePropriete());
                        },
                        child: Text(
                          'Voir tous',
                          style: TextStyle(
                            color: AppTheme.color.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            routeAnimation(context, DetailProprietePage());
                          },
                          child: ProprieteWidget(), ),
                        SizedBox(
                          width: 15,
                        ),
                        ProprieteWidget(),
                        SizedBox(
                          width: 15,
                        ),
                        ProprieteWidget(),
                        SizedBox(
                          width: 15,
                        ),
                        ProprieteWidget(),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
