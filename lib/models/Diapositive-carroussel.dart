

import '../utils/appTheme.dart';

class Dispositive {
  final String imageUrl;
  final String title;
  final String description;

  Dispositive({
    required this.imageUrl,
    required this.description,
    required this.title,
  });
}

final DispositiveList = [
  Dispositive(
    title: 'Location de Maisons et Résidences',
    imageUrl: AppTheme.asset.couverture,
    description:
        'Trouvez votre prochain logement en quelques clics parmi une vaste sélection de maisons et résidences à louer, adaptées à tous les besoins et budgets. ',
  ),
  Dispositive(
    title: 'Vente de Maisons',
    imageUrl: AppTheme.asset.couverture,
    description:
        "Explorez notre catalogue de maisons à vendre, comprenant des propriétés variées pour réaliser votre rêve immobilier. ",
  ),
  Dispositive(
    title: 'Terrains à Vendre ',
    imageUrl: AppTheme.asset.couverture,
    description:
        'Découvrez des terrains disponibles pour construire la maison de vos rêves ou investir, avec des informations claires et précises. ',
  ),
  Dispositive(
    title: 'Accompagnement Personnalisé ',
    imageUrl: AppTheme.asset.couverture,
    description:
        ' Profitez d\'un accompagnement sur mesure par nos experts, qui vous guident à chaque étape de la construction de votre maison.',
  ),
];
