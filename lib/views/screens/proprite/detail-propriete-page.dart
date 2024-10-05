import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mincha/utils/navigation_service.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:mincha/utils/appTheme.dart';

class DetailProprietePage extends StatefulWidget {
  const DetailProprietePage({Key? key}) : super(key: key);

  @override
  _DetailProprietePageState createState() => _DetailProprietePageState();
}

class _DetailProprietePageState extends State<DetailProprietePage> {
  final List<String> images = [
    AppTheme.asset.maisonImage1,
    AppTheme.asset.maisonImage1,
    AppTheme.asset.maisonImage1,
  ];

  // Track the currently selected image in the fullscreen mode
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: Text(
          'Detail maison',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(
          color: AppTheme.color.secondaryColor,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider for house images
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
              ),
              items: images.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),

            // House name and price
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Villa de Luxe',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$1,200,000',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.color.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            'Abidjan, Cocody',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            // House description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Cette villa de luxe est située dans un quartier calme, avec une vue imprenable sur la mer. Elle comprend un grand jardin, une piscine, et des finitions modernes de haute qualité.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20.0),

            // House details (rooms, garage, pool, etc.)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Détails de la maison',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DetailRow(
                      icon: Icons.bed, label: 'Nombre de chambres', value: '4'),
                  DetailRow(
                      icon: Icons.bathtub,
                      label: 'Salles de bains',
                      value: '3'),
                  DetailRow(
                      icon: Icons.garage, label: 'Garage', value: '2 places'),
                  DetailRow(icon: Icons.pool, label: 'Piscine', value: 'Oui'),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // Stats (people viewed and scheduled appointments)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Statistiques',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DetailRow(
                      icon: Icons.visibility,
                      label: 'Nombre de vues',
                      value: '245'),
                  DetailRow(
                      icon: Icons.calendar_today,
                      label: 'Rendez-vous programmés',
                      value: '10'),
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            // House image gallery
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Galerie de la maison',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: images.asMap().entries.map((entry) {
                  int index = entry.key;
                  String imageUrl = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                      _openGallery(context, images, currentIndex);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      // Button to reserve the house
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Action de réservation
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: const Text('Réserver la Maison'),
            //       content: const Text('Votre demande de réservation a été soumise.'),
            //       actions: <Widget>[
            //         TextButton(
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //           child: const Text('OK'),
            //         ),
            //       ],
            //     );
            //   },
            // );

            _showReservationDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.color.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            'Réserver',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Function to open the fullscreen image gallery
  void _openGallery(
      BuildContext context, List<String> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullscreenGallery(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class FullscreenGallery extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullscreenGallery(
      {Key? key, required this.images, required this.initialIndex})
      : super(key: key);

  @override
  _FullscreenGalleryState createState() => _FullscreenGalleryState();
}

class _FullscreenGalleryState extends State<FullscreenGallery> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(widget.images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        itemCount: widget.images.length,
        pageController: PageController(initialPage: currentIndex),
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

// Widget for detail row (icon and text)
class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.color.primaryColor),
          const SizedBox(width: 10.0),
          Text(
            '$label : ',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void _showReservationDialog(BuildContext context) {
  final TextEditingController phoneController = TextEditingController();
  DateTime? selectedDate;
  String? selectedTime;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: Colors.white,
            title: const Text('Réserver un Rendez-vous'),
            content: Container(
              width: 500.0, // Largeur personnalisée
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Phone number field
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Numéro de téléphone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  // Date picker
                  ListTile(
                    title: Text(selectedDate == null
                        ? 'Choisir une date'
                        : 'Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10.0),

                  // Time picker
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Choisir une heure',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedTime,
                    items: ['12h00', '13h00', '14h00'].map((String time) {
                      return DropdownMenuItem<String>(
                        value: time,
                        child: Text(time),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTime = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    AppTheme.color.primaryColor,
                  ),
                ),
                onPressed: () {
                  if (phoneController.text.isNotEmpty &&
                      selectedDate != null &&
                      selectedTime != null) {
                    // Confirmer le rendez-vous ici (ajouter votre logique)
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Rendez-vous confirmé !'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Veuillez remplir tous les champs.'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Confirmez ',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          );
        },
      );
    },
  );
}
