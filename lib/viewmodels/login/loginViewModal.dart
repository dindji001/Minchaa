import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mincha/services/login/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/appTheme.dart';
import '../../views/screens/auth/login/otp-login-page.dart';

class LoginViewModal extends GetxController {
  final LoginService loginService = LoginService();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RxBool isLoading = false.obs;

  void showLoadingDialog() {
    Get.dialog(
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.color.whithColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CircularProgressIndicator(
                color: AppTheme.color.primaryColor,
              ),
            ),
          ),
        ), // Personnalisez le widget de chargement selon vos besoins
      ),
      barrierDismissible:
          false, // Empêche la fermeture en cliquant à l'extérieur
    );
  }

  // Définissez les bordures et couleurs pour les champs
  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppTheme.color.primaryColor),
    borderRadius: BorderRadius.circular(15),
  );

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {});
  }

  bool isEmailValid(String? email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegExp.hasMatch(email ?? '');
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre adresse email';
    } else if (!isEmailValid(value)) {
      return 'Adresse email invalide';
    }
    return null;
  }

  Future<void> submitForm() async {
    if (formKeyLogin.currentState!.validate()) {
      final email = emailController.text;

      showLoadingDialog();
      try {
        final response = await loginService.login(
          email,
        );
        isLoading.value = false; // Arrête le chargement

        print("Response received: $response");
        if (response['message'] ==
            'Veuillez consulter votre boite mail pour le code de validation') {
          print("###############################C#########################");
          print(response['userToken']);
          print("####################################");
          // Ferme la boîte de dialogue de chargement avant de naviguer
          SharedPreferences prefs = await _prefs;
          prefs.setString('tokenLoginExpire', response['userToken']);
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(
                  ' Veuillez consulter votre boite mail pour le code de validation'),
              backgroundColor: AppTheme.color.secondaryColor,
            ),
          );
          // Get.back();

          // Naviguer vers la page suivante après l'inscription réussie
          Get.offAll(VerifyPhoneLoginOtp());
        } else {
          Get.back(); // Ferme la boîte de dialogue de chargement en cas d'erreur

          Get.snackbar('Erreur',
              response['message'] ?? 'Une erreur inconnue est survenue');
        }
      } catch (e) {
        print('dindji severin: $e');
        Get.back();
        isLoading.value = false; // Arrête le chargement en cas d'erreur

        // Utiliser le ScaffoldMessenger pour afficher le SnackBar

        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text(' $e'),
            backgroundColor: AppTheme.color.secondaryColor,
          ),
        );
      }
    }
  }
}
