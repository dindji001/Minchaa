import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mincha/viewmodels/login/loginViewModal.dart';

import '../../../utils/appTheme.dart';
import '../../../utils/navigation_service.dart';
import '../../../viewmodels/login/veryfyOtpLoginViewModel.dart';
import '../../../viewmodels/register/verifyOtpViewModel.dart';
import '../../widgets/button.dart';
import '../../widgets/container-widget.dart';
import '../../widgets/propriete_row-widget.dart';
import '../favories/favories-page.dart';
import '../setting/settingPage.dart';
import 'menu-profil/rdv_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<VerifyOtpLoginViewModel>();
    final registerController = Get.find<VerifyOtpViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Text(
          'Profil Utilisateur',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(
          color: AppTheme.color.whithColor,
        ),
        backgroundColor: AppTheme.color.whithColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 5, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppTheme.asset.utilisateur),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      loginController.firstname.value.isEmpty &&
                              loginController.lastname.value.isEmpty
                          ? '${registerController.firstname.value} ${registerController.lastname.value}'
                          : '${loginController.firstname.value} ${loginController.lastname.value}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      loginController.email.value.isEmpty
                          ? '${registerController.email.value}'
                          : '${loginController.email.value}',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.color.secondaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      loginController.phone.value.isEmpty
                          ? '${registerController.phone.value}'
                          : '${loginController.phone.value}',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.color.secondaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CButton(
                          title: 'Modifier profil',
                          onPressed: () {
                            // Ajoutez la navigation vers la page de modification du profil ici
                          },
                          width: width(context) * 0.45,
                          sideWidth: 3,
                          sizeTitle: 13,
                          sideColor: AppTheme.color.primaryColor,
                          color: AppTheme.color.whithColor,
                          titleColor: AppTheme.color.primaryColor,
                        ),
                        CButton(
                          title: 'Mes créances',
                          sizeTitle: 13,
                          width: width(context) * 0.45,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppTheme.color.backgroundTextField2,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          size: 30,
                          color: AppTheme.color.primaryColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Information urgente',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.color.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'La liste des favories',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          routeAnimation(context, FavoriesPage());
                        },
                        child: Text(
                          'voir tous',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.color.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ProprieteRowWidget(
                        urlImageContenaire: AppTheme.asset.maisonImage1,
                      ),
                      SizedBox(height: 10),
                      ProprieteRowWidget(
                        urlImageContenaire: AppTheme.asset.maisonImage1,
                      ),
                      SizedBox(height: 10),
                      ProprieteRowWidget(
                        urlImageContenaire: AppTheme.asset.maisonImage1,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  ContenaireWidget(
                    urlImageContenaire: AppTheme.asset.statistique,
                    nomImageContenaire: 'Mes Rendez-vous',
                    urlNextPageContenaire: RdvPage(),
                  ),
                  ContenaireWidget(
                    urlImageContenaire: AppTheme.asset.category,
                    nomImageContenaire: 'Paramètres',
                    urlNextPageContenaire: ParametrePage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
