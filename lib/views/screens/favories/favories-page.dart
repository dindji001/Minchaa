import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mincha/utils/navigation_service.dart';
import 'package:mincha/views/widgets/button.dart';
import '../../../utils/appTheme.dart';
import '../../widgets/propriete_row-widget.dart';

class FavoriesPage extends StatelessWidget {
  const FavoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          'Mes Favories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => _showFilterModal(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(
                    AppTheme.assetSvg.filtre,
                  ),
                ),
              ),
            ),
          )
        ],
        iconTheme: IconThemeData(
          color: AppTheme.color.secondaryColor,
        ),
        backgroundColor: AppTheme.color.whithColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            ProprieteRowWidget(
              urlImageContenaire: AppTheme.asset.maisonImage1,
            ),
            ProprieteRowWidget(
              urlImageContenaire: AppTheme.asset.maisonImage1,
            )
          ],
        ),
      ),
    );
  }

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Color.fromARGB(208, 33, 59, 76),
      isScrollControlled: true, // Permet au modal de prendre plus de hauteur
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9, // Modal occupe 90% de la hauteur
          maxChildSize: 0.9, // Limite la taille à 90% de la hauteur
          minChildSize: 0.5, // Taille minimale du modal
          expand: false,
          builder: (context, scrollController) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60), // Ajoute de l'espace pour le titre et le trait
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20), // Espace en haut pour le titre
                          // Filtrer par Villes
                          Text("Villes"),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _cityFilterButton(context, "Abidjan"),
                                _cityFilterButton(context, "Agboville"),
                                _cityFilterButton(context, "Bouake"),
                                _cityFilterButton(context, "Yamoussokro"),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Résultat du tri
                          Text("Résultat du tri"),
                          Column(
                            children: [
                              RadioListTile(
                                value: "populaire",
                                groupValue: "tri",
                                onChanged: (value) {},
                                title: Text("Plus Populaire"),
                              ),
                              RadioListTile(
                                value: "cher",
                                groupValue: "tri",
                                onChanged: (value) {},
                                title: Text("Prix plus cher"),
                              ),
                              RadioListTile(
                                value: "moinscher",
                                groupValue: "tri",
                                onChanged: (value) {},
                                title: Text("Prix moins cher"),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Fourchette de prix
                          Text("Fourchette de prix"),
                          RangeSlider(
                            values: RangeValues(100, 500),
                            min: 0,
                            max: 1000,
                            divisions: 10,
                            labels: RangeLabels('100', '500'),
                            onChanged: (RangeValues values) {},
                          ),
                          SizedBox(height: 20),
                          // Évaluation étoilée
                          Text("Évaluation étoilée"),
                          Slider(
                            value: 3,
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: '3 étoiles',
                            onChanged: (double value) {},
                          ),
                          SizedBox(height: 20),
                          // Installations
                          Text("Installations"),
                          Wrap(
                            spacing: 10,
                            children: [
                              _selectableButton(context, "Wifi"),
                              _selectableButton(context, "Parking"),
                              _selectableButton(context, "Piscine"),
                              _selectableButton(context, "Restaurant"),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Boutons Appliquer et Réinitialiser
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CButton(
                                onPressed: () {
                                  // Appliquer les filtres
                                  Navigator.pop(context);
                                },
                                color: AppTheme.color.backgroundTextField2,
                                titleColor: AppTheme.color.primaryColor,
                                title: 'Réinitialiser',
                                sizeTitle: 14,
                                width: width(context) * 0.45,
                              ),
                              CButton(
                                onPressed: () {
                                  // Réinitialiser les filtres
                                  Navigator.pop(context);
                                },
                                title: 'Appliquer Filtre',
                                sizeTitle: 14,
                                width: width(context) * 0.45,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Trait indicatif et titre fixes
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Filtre Favorie",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _cityFilterButton(BuildContext context, String cityName) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(cityName),
    );
  }

  Widget _selectableButton(BuildContext context, String label) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(label),
    );
  }
}
