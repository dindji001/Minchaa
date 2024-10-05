import 'package:flutter/material.dart';

import '../../../../utils/appTheme.dart';
import '../../../../utils/navigation_service.dart';
import '../../../widgets/button.dart';


class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppTheme.color.primaryColor,
        ),
        title: Text('Creer un nouveau mot de passe', style: TextStyle(fontSize: 14),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppTheme.asset.password,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.left,
              'Creez un nouveau mot de passe',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: AppTheme.color.backgroundTextFieldBordu,
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppTheme.color.backgroundTextFieldBordu,
                ),
                hintText: "Nouveau mot de passe",
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
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: AppTheme.color.backgroundTextFieldBordu,
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppTheme.color.backgroundTextFieldBordu,
                ),
                filled: true,
                hintText: "Confirmer mot de passe",
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
            ),
            SizedBox(
              height: 30,
            ),
            CButton(
              title: 'Modifier',
              onPressed: () {},
              width: width(context),
            )
          ],
        ),
      ),
    );
  }
}
