import 'package:flutter/material.dart';
import 'package:mincha/utils/appTheme.dart';
import 'package:mincha/utils/navigation_service.dart';
import 'package:mincha/views/screens/auth/login/otp-login-page.dart';
import 'package:mincha/views/widgets/button.dart';

import '../register/ftp-page.dart';

class ChooseSendPassword extends StatelessWidget {
  const ChooseSendPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mot de passe oublié ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppTheme.asset.forgetPassword,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
              style: TextStyle(
                fontSize: 12,
              ),
            ), 
            SizedBox(height: 20,),
            Column(children: [Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildUserTypeOption(
                  context,
                  // userTypeViewModel,
                  // UserType.newUser,
                  "via sms:",
                  "+225 1111****999",
                  Icons.messenger_sharp,
                ),
                SizedBox(
                  height: 15,
                ),
                _buildUserTypeOption(
                  context,
                  // userTypeViewModel,
                  // UserType.oldUser,
                  "via email.",
                  "sever****@gmail.com",
                  Icons.email,
                ),
              ],
            ),],),
            SizedBox(height: 20,),
            CButton(title: 'Envoyer', onPressed: (){
              // route(context, FtpForgetPasswordPage());
            })
          ],
        ),
      ),
    );
  }


  Widget _buildUserTypeOption(
    BuildContext context,
    // UserTypeViewModel userTypeViewModel,
    // UserType userType,
    String title,
    String subtitle,
    IconData icon,
  ) {
    // return Obx(() {
      return GestureDetector(
        onTap: () {
          // userTypeViewModel.selectUserType(userType);
        },
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              // color: userTypeViewModel.selectedUserType.value == userType
              //     ? AppTheme.color.primaryColor
              //     : Colors.black26,
              color: AppTheme.color.primaryColorFiltre
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: AppTheme.color.primaryColorFiltre,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  icon,
                  size: 55,
                  color: AppTheme.color.primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      // color:
                      //     userTypeViewModel.selectedUserType.value == userType
                      //         ? AppTheme.color.primaryColor
                      //         : Color(0xFFC3C3C3),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // color:
                      //     userTypeViewModel.selectedUserType.value == userType
                      //         ? AppTheme.color.primaryColor
                      //         : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    // });
  }
}
