import 'package:flutter/material.dart';
import 'package:mincha/utils/navigation_service.dart';

import '../screens/notification/notification-page.dart';

class SettingPageWidget extends StatelessWidget {
  const SettingPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, right: 10, left: 10, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Modifier profil',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.password,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Mot de passe',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    routeAnimation(context, NotificationsPage());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_voice,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Assistance vocale',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Equipe d’assistance',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.privacy_tip,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'politique de confidentialité',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.money,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Taxes',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(
                Icons.logout,
                size: 30,
                color: Colors.red,
              ),
              Text(
                'Deconnexion',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
