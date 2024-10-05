import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mincha/services/register/register_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/appTheme.dart';
import '../../utils/navigation_service.dart';
import '../../views/screens/auth/register/ftp-page.dart';

class RegisterViewModel extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final RegisterService registerService = RegisterService();
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyRegisterPassword = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool isLoading = false.obs;

  RxString selectedOption = 'Homme'.obs;
  List<String> sexes = ['Homme', 'Femme'];

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

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
    nameController.addListener(() {});
    lastnameController.addListener(() {});
    emailController.addListener(() {});
    confirmPasswordController.addListener(() {});
  }

  bool isEmailValid(String? email) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegExp.hasMatch(email ?? '');
  }

  String? validateNom(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre nom';
    }
    return null;
  }

  String? validatePrenom(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre prénom';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numéro de téléphone';
    }
    return null;
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
    if (formKeyRegister.currentState!.validate()) {
      final name = nameController.text;
      final lastname = lastnameController.text;
      final email = emailController.text;
      final phoneNumber = phoneController.text;

      String sexe = '';
      if (selectedOption.value == 'Homme') {
        sexe = '1'; // Par exemple, '1' pour Homme
      } else {
        sexe = '2'; // Par exemple, '2' pour Femme
      }
      showLoadingDialog();

      try {
        final response = await registerService.register(
          name,
          lastname,
          email,
          sexe,
          phoneNumber,
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
          prefs.setString('tokenExpire', response['userToken']);
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(' Veuillez consulter votre boite mail pour le code de validation'),
              backgroundColor: AppTheme.color.secondaryColor,
            ),
          );
          // Get.back();

          // Naviguer vers la page suivante après l'inscription réussie
          Get.offAll(VerifyPhoneOtp());
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
        if (e ==
            'Exception: Échec ! Numéro de téléphone ou Email déjà utilisé !') {
          const errorMessage =
              "Échec ! Numéro de téléphone ou Email déjà utilisé !";
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(' $errorMessage'),
              backgroundColor: AppTheme.color.secondaryColor,
            ),
          );
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(' $e'),
              backgroundColor: AppTheme.color.secondaryColor,
            ),
          );
        }
        ;

        print("Error occurred: $e");
      }
    }
  }

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  void toggleConfirmePasswordVisibility() {
    obscureConfirmPassword.toggle();
  }
}
