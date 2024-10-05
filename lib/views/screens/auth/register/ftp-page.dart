import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/appTheme.dart';
import '../../../../utils/navigation_service.dart';
import '../../../../viewmodels/register/verifyOtpViewModel.dart';
import '../../../widgets/button.dart';
import '../../home/route-menu.dart';

class VerifyPhoneOtp extends StatefulWidget {
  const VerifyPhoneOtp({super.key});

  @override
  State<VerifyPhoneOtp> createState() => _VerifyPhoneOtpState();
}

class _VerifyPhoneOtpState extends State<VerifyPhoneOtp> {
  final VerifyOtpViewModel otpViewModel = Get.put(VerifyOtpViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppTheme.color.textColor, // <-- SEE HERE
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: width(context) * 0.3,
              width: width(context) * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppTheme.asset.logo2),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width(context) * 0.8,
              child: Text(
                "Veuillez saisir le code envoyé par email sur seve*****gmail.com",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 _textFieldOTP(otpViewModel.otp1Controller, first: true, last: false),
                  SizedBox(width: 5),
                  _textFieldOTP(otpViewModel.otp2Controller, first: false, last: false),
                  SizedBox(width: 5),
                  _textFieldOTP(otpViewModel.otp3Controller, first: false, last: false),
                  SizedBox(width: 5),
                  _textFieldOTP(otpViewModel.otp4Controller, first: false, last: false),
                  SizedBox(width: 5),
                  _textFieldOTP(otpViewModel.otp5Controller, first: false, last: false),
                  SizedBox(width: 5),
                  _textFieldOTP(otpViewModel.otp6Controller, first: false, last: true),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CButton(
              title: "Suivant",
              onPressed: () {
                otpViewModel.verifyOtpRegister();
                // route(context, const RootApp(), close: true);
              },
            ),
            SizedBox(
              height: 15,
            ),
            CButton(
                title: "Envoyer un autre code 00:24",
                onPressed: otpViewModel.isButtonEnabled ? () {
                  otpViewModel.resentOtpRegister();
                } : null,
                sizeTitle: 14,
                color: otpViewModel.isButtonEnabled == true ? AppTheme.color.secondaryColor : AppTheme.color.secondaryColorFiltre,
                titleColor: otpViewModel.isButtonEnabled == true ? AppTheme.color.primaryColor : AppTheme.color.primaryColorFiltre)  ,
          ],
        ),
      ),
    ); 
  }

 
  Widget _textFieldOTP(TextEditingController controller, {required bool first, required bool last}) {
    return Container(
      height: 65,
      width: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller, // Lier le contrôleur
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: AppTheme.color.primaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
