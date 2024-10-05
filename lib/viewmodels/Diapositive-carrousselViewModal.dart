import 'package:get/get.dart';

import '../models/Diapositive-carroussel.dart';

class CarrouselViewModel extends GetxController {
  final RxInt currentPage = 0.obs;
  final List<Dispositive> dispositiveList = DispositiveList;
}
