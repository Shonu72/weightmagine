import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weightmagine/services/db/db_service.dart';
import 'package:weightmagine/src/models/weight_model.dart';

class WeightController extends GetxController {
  var weights = <WeightModel>[].obs;
  var selectedTime = TimeOfDay.now().obs;

  @override
  void onInit() {
    loadWeights();
    super.onInit();
  }

  Future<void> loadWeights() async {
    var dbWeights = await DatabaseService().getAllWeights();
    weights.assignAll(dbWeights);
  }

  Future<void> addWeight(WeightModel weight) async {
    await DatabaseService().insertWeight(weight);
    loadWeights();
  }

  void setReminderTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  TimeOfDay getReminderTime() {
    return selectedTime.value;
  }
}
