import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/appTheme.dart';
import '../../../../utils/navigation_service.dart';
import '../../../../viewmodels/login/loginViewModal.dart';
import '../../../widgets/button.dart';
import '../../home/route-menu.dart';
import '../forget-password/choose-send-password.dart';
import '../forget-password/recupere-page.dart';
import '../register/register.dart';

class LoginPgeScreen extends StatefulWidget {
  const LoginPgeScreen({super.key});

  @override
  State<LoginPgeScreen> createState() => _LoginPgeScreenState();
}

class _LoginPgeScreenState extends State<LoginPgeScreen> { 
  final LoginViewModal loginViewModal = Get.put(LoginViewModal());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: SizedBox(
            child: Form(
              key: loginViewModal.formKeyLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height(context) * 0.60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.color
                                    .textColor), // Style du texte par défaut
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Connectez-vous a votre compte? ',
                                style:
                                    TextStyle(color: AppTheme.color.textColor),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Rediriger l'utilisateur vers la page LoginPage
                                    // route(
                                    //   context,
                                    //   RegisterUserPage(),
                                    // ); // Assurez-vous d'avoir la gestion de la navigation avec GetX
                                  },
                                text: 'MINCHA',
                                style: TextStyle(
                                    color: AppTheme.color.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: loginViewModal.emailController,
                              decoration: InputDecoration(
                                focusedBorder: loginViewModal.focusedBorder,
                                errorBorder: loginViewModal.errorBorder,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0XffE5E5E5),
                                ),
                                filled: true,
                                hintText: "Entrez votre adress email",
                                hintStyle: TextStyle(
                                  color: Color(0XffE5E5E5),
                                  fontSize: 14,
                                ),
                                fillColor: AppTheme.color.backgroundTextField,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                              ),
                              onChanged: (value) {},
                              validator: loginViewModal.validateEmail
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CButton(
                          title: "Connexion",
                          onPressed: () {
                            loginViewModal.submitForm();
                          },
                          color: AppTheme.color.primaryColor,
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme
                              .color.textColor), // Style du texte par défaut
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Vous avez pas de compte? ',
                          style: TextStyle(color: AppTheme.color.textColor),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Rediriger l'utilisateur vers la page LoginPage
                              route(
                                context,
                                RegisterUserPage(),
                              ); // Assurez-vous d'avoir la gestion de la navigation avec GetX
                            },
                          text: 'Inscrivez-vous',
                          style: TextStyle(color: AppTheme.color.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 2,
                            width: (width(context) / 2) - 30,
                            decoration: BoxDecoration(
                              color: AppTheme.color.backgroundTextField,
                            ),
                          ),
                          Text(
                            "Ou",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: AppTheme.color.backgroundTextField,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: (width(context) / 2) - 30,
                            decoration: BoxDecoration(
                              color: AppTheme.color.backgroundTextField,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
