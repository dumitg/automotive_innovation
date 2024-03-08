import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetCar extends GetxController {
  RxBool engin = true.obs;
  RxBool door = true.obs;
  RxBool trunk = true.obs;
  RxBool climate = true.obs;

  setEngine() {
    engin.value = !engin.value;
    Get.snackbar('Info: ',
        'Motorul a fost ${engin.value == false ? 'inchis' : 'deschis'}',
        icon: const Icon(Icons.info_outline, color: Colors.white24),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3));
  }

  setDoor() {
    door.value = !door.value;
    Get.snackbar('Info: ',
        'Clima a fost ${door.value == false ? 'inchisa' : 'deschisa'}',
        icon: const Icon(Icons.info_outline, color: Colors.white24),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3));
  }

  setTrunk() {
    trunk.value = !trunk.value;
  }

  setClimate() {
    climate.value = !climate.value;
    Get.snackbar(
        'Info: ', 'Clima a fost ${engin.value == false ? 'inchis' : 'deschis'}',
        icon: const Icon(Icons.info_outline, color: Colors.white24),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3));
  }
}
