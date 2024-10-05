import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mincha/utils/navigation_service.dart';
import 'package:mincha/viewmodels/register/registerViewModels.dart';
import 'package:mincha/views/widgets/button.dart';

import '../../../../utils/appTheme.dart';
import 'ftp-page.dart';

class PasswordPage extends StatelessWidget {
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
            key: registerViewModel.formKeyRegisterPassword,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 170,
                    
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppTheme.asset.password,
                      ),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Veillez saisir votre mot de passe',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          // controller: registerViewModel.passwordController,
                          decoration: InputDecoration(
                            focusedBorder:
                            registerViewModel.focusedBorder,
                            errorBorder:
                            registerViewModel.errorBorder,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0XffE5E5E5),
                            ),
                            filled: true,
                            hintText: "Mot de passe",
                            hintStyle: TextStyle(
                              color: Color(0XffE5E5E5),
                              fontSize: 14,
                            ),
                           
                            fillColor: AppTheme.color.backgroundTextField,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: IconButton(
                              icon: Obx(() => Icon(
                                    registerViewModel.obscurePassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0XffE5E5E5),
                                  )),
                              onPressed: () {
                                registerViewModel.togglePasswordVisibility();
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                          ),
                          onChanged: (value) {},
                          obscureText:
                              registerViewModel.obscurePassword.value,
                          // validator: registerViewModel.validatePassword,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: registerViewModel.confirmPasswordController,
                          decoration: InputDecoration(
                            focusedBorder:
                            registerViewModel.focusedBorder,
                            errorBorder:
                            registerViewModel.errorBorder,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0XffE5E5E5),
                            ),
                            filled: true,
                            hintText: "Confirmer votre mot de passe",
                            hintStyle: TextStyle(
                              color: Color(0XffE5E5E5),
                              fontSize: 14,
                            ),
                            
                            fillColor: AppTheme.color.backgroundTextField,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: IconButton(
                              icon: Obx(() => Icon(
                                    registerViewModel.obscurePassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color(0XffE5E5E5),
                                  )),
                              onPressed: () {
                                registerViewModel.toggleConfirmePasswordVisibility();
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            
                          ),
                          onChanged: (value) {},
                          // obscureText:
                          //     loginViewModel.obscurePassword.value,
                              //  validator: registerViewModel.validateConfirmPassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                CButton(
                    title: 'creer un compte',
                    onPressed: () {
                    // registerViewModel.submitFormPassword();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
