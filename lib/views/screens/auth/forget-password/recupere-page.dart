import 'package:flutter/material.dart';

import '../../../../utils/appTheme.dart';
import '../../../../utils/navigation_service.dart';
import '../../../widgets/button.dart';
import 'new-passord.dart';

class RecupererPasswordPage extends StatefulWidget {
  const RecupererPasswordPage({super.key});

  @override
  State<RecupererPasswordPage> createState() => _RecupererPasswordPageState();
}

class _RecupererPasswordPageState extends State<RecupererPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppTheme.color.primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppTheme.asset.logo2,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.left,
              'Mot de passe oublié?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Si vous avez oublié votre mot de passe, ne vous inquiétez pas ! Nous sommes là pour vous aider à récupérer l'accès à votre compte. Veuillez fournir l'une des informations suivantes associées à votre  compte :",
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                hintText: "Email ou numero de telephone",
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
              title: 'Récupérer',
              onPressed: () {
                routeAnimation(
                  context,
                  NewPasswordPage(),
                );
              },
              width: width(context),
            )
          ],
        ),
      ),
    );
  }
}
