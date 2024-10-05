import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mincha/services/register/register_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/appTheme.dart';
import '../../views/screens/home/route-menu.dart';

class VerifyOtpViewModel extends GetxController {
  final RegisterService registerService = RegisterService();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final TextEditingController otp1Controller = TextEditingController();
  final TextEditingController otp2Controller = TextEditingController();
  final TextEditingController otp3Controller = TextEditingController();
  final TextEditingController otp4Controller = TextEditingController();
  final TextEditingController otp5Controller = TextEditingController();
  final TextEditingController otp6Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  RxBool isLoading = false.obs;
  bool isButtonEnabled = false;

  // Informations de l'utilisateur
  RxString firstname = ''.obs;
  RxString lastname = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;

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

  Future<void> resentOtpRegister() async {
    if (isButtonEnabled == true) {

        final email = emailController.text;
        showLoadingDialog();
        try {
          final response =
              await registerService.resentCustomerOtpRegister(email);
          if (response['message'] ==
              'Veuillez consulter votre boîte mail pour le code de validation') {
            SharedPreferences prefs = await _prefs;
            prefs.setString('tokenExpire', response['userToken']);
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              SnackBar(
                content: Text(
                    ' Veuillez consulter votre boite mail pour le code de validation'),
                backgroundColor: AppTheme.color.secondaryColor,
              ),
            );
          }
        } catch (e) {
          print(e);
        }
      
    } else if(isButtonEnabled == false) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(' le bouton est desactivé'),
          backgroundColor: AppTheme.color.secondaryColor,
        ),
      );
    }
  }

  // Méthode pour récupérer l'OTP complet et vérifier
  Future<void> verifyOtpRegister() async {
    String otp = otp1Controller.text +
        otp2Controller.text +
        otp3Controller.text +
        otp4Controller.text +
        otp5Controller.text +
        otp6Controller.text;
    showLoadingDialog();
    print(
        "###########################DINDJI##################################");

    if (otp.length == 6) {
      // Logique pour vérifier l'OTP
      try {
        print(
            "###########################SEVERIN WIL##################################");
        final response = await registerService.verifyOtpRegister(otp);
        isLoading.value = false; // Arrête le chargement
        if (response['userToken'] != null && response['userToken'].isNotEmpty) {
          firstname.value = response['userFirstname'];
          lastname.value = response['userLastname'];
          phone.value = response['userPhoneNumber'];
          email.value = response['userEmail'];
          // Si l'OTP est correct, enregistrez le token

          // Navigatez vers la page suivante
          print(response['userToken'] 
             );
          print(response);
          SharedPreferences prefs = await _prefs;
          prefs.setString('token', response['userToken']);
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(' Votre compte a été avec succes'),
              backgroundColor: AppTheme.color.secondaryColor,
            ),
          );
          Get.offAll(RootApp());
        }
        // Get.back(); // Ferme le dialogue de chargement

        // print('33333333333333333333333333333333333333333333333333333');
        // print(response);
        // print('33333333333333333333333333333333333333333333333333333');
      } catch (e) {
        print('Severindindji: $e');
      }
      print("###########################OPT##################################");
      print("OTP saisi: $otp");
      print("###########################OPT##################################");

      // Vous pouvez ajouter la logique pour vérifier l'OTP ici
    } else {
      Get.snackbar('Erreur', 'Veuillez entrer les 6 chiffres de l\'OTP');
    }
  }
}
