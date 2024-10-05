import 'package:flutter/material.dart';
import 'package:mincha/utils/appTheme.dart';

import 'notification-item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,  color: Colors.white),
        ),
         iconTheme: IconThemeData(
          color: AppTheme.color.whithColor,
        ),
        backgroundColor: AppTheme.color.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          NotificationItem(
            icon: Icons.announcement,
            title: 'Nouvelle Annonce',
            description:
                'Découvrez nos nouvelles fonctionnalités disponibles dès maintenant !',
            timestamp: 'Il y a 2 heures',
          ),
          NotificationItem(
            icon: Icons.update,
            title: 'Mise à Jour de Service',
            description: 'Le service X a été mis à jour avec de nouvelles options.',
            timestamp: 'Hier',
          ),
          NotificationItem(
            icon: Icons.warning,
            title: 'Alerte Sécurité',
            description: 'Veuillez mettre à jour votre mot de passe pour plus de sécurité.',
            timestamp: 'Il y a 2 jours',
          ),
          NotificationItem(
            icon: Icons.local_offer,
            title: 'Promotion Spéciale',
            description: 'Profitez d\'une réduction de 20% sur tous nos produits !',
            timestamp: 'Il y a 3 jours',
          ),
          NotificationItem(
            icon: Icons.new_releases,
            title: 'Nouvel Article',
            description: 'Un nouvel article est disponible dans votre catégorie préférée.',
            timestamp: 'Il y a 5 jours',
          ),
          NotificationItem(
            icon: Icons.event,
            title: 'Événement à venir',
            description: 'Ne manquez pas notre événement en direct la semaine prochaine.',
            timestamp: 'Il y a 1 semaine',
          ),
        ],
      ),
    );
  }
}

