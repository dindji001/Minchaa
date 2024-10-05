// lib/presentation/view/carrousel_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../utils/appTheme.dart';
import '../../../../../../utils/navigation_service.dart';
import '../../../../../../viewmodels/Diapositive-carrousselViewModal.dart';

import '../../widgets/button.dart';
import '../auth/first-page-auths.dart';
import '../auth/login/login-page.dart';
import '../first-page.dart';

class CarrouselPage extends StatelessWidget {
  final CarrouselViewModel viewModel = Get.put(CarrouselViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 200),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(-1.0, 0.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return FirstPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Retour",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.color.primaryColor,
                      ),
                    ))
              ],
            ),
            Expanded(
              child: PageView(
                controller: PageController(
                  initialPage: viewModel.currentPage.value,
                ),
                onPageChanged: (int page) {
                  viewModel.currentPage.value = page;
                },
                children: viewModel.dispositiveList.map((dispositive) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          width: width(context) ,
                          height: width(context) - 10,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(dispositive.imageUrl),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          dispositive.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          dispositive.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < viewModel.dispositiveList.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 20),
                      child: Container(
                        height: 10,
                        width: i == viewModel.currentPage.value ? 40 : 10,
                        decoration: BoxDecoration(
                          color: i == viewModel.currentPage.value
                              ? AppTheme.color.primaryColor
                              : AppTheme.color.backgroundTextField,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                ],
              );
            }),
            Obx(
              () {
                if (viewModel.currentPage.value <
                    viewModel.dispositiveList.length - 1) {
                  return Container();
                } else {
                  return SizedBox(
                    child: CButton(
                      color: AppTheme.color.primaryColor,
                      titleColor: AppTheme.color.whithColor,
                      onPressed: () {
                        route(context, const LoginPgeScreen(), close: true);
                      },
                      title: 'Commencer ici',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
