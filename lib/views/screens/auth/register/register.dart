import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mincha/utils/appTheme.dart';
import 'package:mincha/utils/navigation_service.dart';
import 'package:mincha/viewmodels/register/registerViewModels.dart';
import 'package:mincha/views/screens/auth/register/motdepass.dart';
import 'package:mincha/views/widgets/button.dart';

class RegisterUserPage extends StatelessWidget {
  final RegisterViewModel registerViewModel = Get.put(RegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: registerViewModel.formKeyRegister,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Remplissez votre profil',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: width(context),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('Ajouter une photo de profil',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: AppTheme.color.backgroundTextField,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  Icons.person,
                                  color: AppTheme.color.secondaryColor,
                                  size: 80,
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: Icon(
                                    Icons.photo_camera,
                                    color: AppTheme.color.primaryColor,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          TextFormField(
                            controller: registerViewModel.nameController,
                            decoration: InputDecoration(
                                  errorBorder:
                          registerViewModel.errorBorder,
                              focusedBorder: registerViewModel.focusedBorder,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0XffD9D9D9),
                              ),
                              filled: true,
                              hintText: "Nom",
                              hintStyle: TextStyle(
                                color: Color(0XffD9D9D9),
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
                            validator: registerViewModel.validateNom,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                             controller: registerViewModel.lastnameController,
                            decoration: InputDecoration(
                                  errorBorder:
                          registerViewModel.errorBorder,
                              focusedBorder: registerViewModel.focusedBorder,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0XffD9D9D9),
                              ),
                              filled: true,
                              hintText: "Prenoms",
                              hintStyle: TextStyle(
                                color: Color(0XffD9D9D9),
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
                            validator: registerViewModel.validatePrenom,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IntlPhoneField(
                            controller: registerViewModel.phoneController,
                            decoration: InputDecoration(
                                  errorBorder:
                          registerViewModel.errorBorder,
                              focusedBorder: registerViewModel.focusedBorder,
                              filled: true,
                              fillColor: AppTheme.color.backgroundTextField,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: 'Numéro de téléphone',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                            initialCountryCode: 'CI',
                            validator: (PhoneNumber? phoneNumber) {
                              if (phoneNumber == null) {
                                return 'Veuillez entrer votre numéro de téléphone';
                              }
                              return null;
                            },
                            
                            onSaved: (PhoneNumber? phoneNumber) {
                              // Handle saving logic if needed
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: registerViewModel.emailController,
                            decoration: InputDecoration(
                              focusedBorder: registerViewModel.focusedBorder,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0XffD9D9D9),
                              ),
                              filled: true,
                              hintText: "Adresse email",
                              hintStyle: TextStyle(
                                color: Color(0XffD9D9D9),
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
                            validator: registerViewModel.validateEmail,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Sexe :",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.color.textColor,
                                  ),
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor: AppTheme.color.whithColor,
                                value: registerViewModel.selectedOption.value,
                                onChanged: (newValue) {
                                  registerViewModel.setSelectedOption(newValue!);
                                },
                                items: registerViewModel.sexes.map((type) {
                                  return DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(type),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  focusedBorder: registerViewModel.focusedBorder,
                                  filled: true,
                                  fillColor: AppTheme.color.backgroundTextField,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // contentPadding: EdgeInsets.symmetric(vertical: 15),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Ajout du padding ici
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CButton(
                    title: 'creer un compte',
                    onPressed: () {
                      registerViewModel.submitForm();
                     
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
