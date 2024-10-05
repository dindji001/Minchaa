import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final color = _color();
  static final asset = _Asset();
  static final assetSvg = _AssetSvg();
}

class _color {
  final primaryColor = Color(0xFF22A4D5);
  final primaryColorFiltre = Color.fromARGB(255, 185, 234, 253);
  final secondaryColor = Color(0xFF213B4C);
  final secondaryColorFiltre = Color.fromARGB(255, 149, 153, 156);
  final whithColor = Color(0xffFFFFFF);
  final textColor = Color(0xFF2B2525);
  final backgroundTextField = Color(0XFFF7F7F7);
  final backgroundTextField2 = Color(0XFFF3FCFF);
  final backgroundTextFieldBordu = Color(0XFFA8A8A9);
  final orangeColor = Color(0xFFFF8500);
}

class _Asset {
  final logo = "assets/images/logo.png";
  final logo2 = "assets/images/logoApp.png";
  final orangeMoney = "assets/images/orange.png";
  final mtnMoney = "assets/images/MTN.jpg";
  final moovMoney = "assets/images/moov.jpg";
  final backgroundImage = "assets/images/background.png";
  final facebook = "assets/images/facebook.png";
  final apple = "assets/images/apple.png";
  final google = "assets/images/google.png";
  final utilisateur = "assets/images/utilisateur.png";
  final creancier = "assets/images/creancier.png";
  final dette = "assets/images/dette.png";
  final stock = "assets/images/stock.png";
  final ventes = "assets/images/ventes.png";
  final ruptureStock = "assets/images/rupture-de-stock.png";
  final alarme = "assets/images/alarme.png";
  final inviter = "assets/images/inviter.png";
  final facture = "assets/images/facture.png";
  final achat = "assets/images/achat.png";
  final category = "assets/images/categorie.png";
  final statistique = "assets/images/statistique.png";
  final debiteur = "assets/images/debiteur.png";
  final couverture = "assets/images/couverture.jpeg";
  final password = "assets/images/password.png";
  final forgetPassword = "assets/images/mot-de-passe-oublie.png";
  final imagepub = "assets/images/imagepub.png";
  final maisonImage1 = "assets/images/maison.png";
}

class _AssetSvg {
  final business = "assets/svg/undraw_business_deal_re_up4u.svg";
  final ideas = "assets/svg/undraw_ideas_flow_re_bmea 1.svg";
  final spreadsheet = "assets/svg/undraw_spreadsheet_re_cn18 1.svg";
  final stripe_payments = "assets/svg/undraw_stripe_payments_re_chlm.svg";
  final notificationSvg = "assets/svg/notification.svg";
  final profilSvg = "assets/svg/prifil.svg";
  final sliders = "assets/svg/sliders.svg";
  final filtre = "assets/svg/filtre.svg";
}
