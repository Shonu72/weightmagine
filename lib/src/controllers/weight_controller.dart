import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weightmagine/core/utils/helpers.dart';
import 'package:weightmagine/services/db/db_service.dart';
import 'package:weightmagine/src/models/weight_model.dart';

class WeightController extends GetxController {
  var weights = <WeightModel>[].obs;
  var selectedTime = TimeOfDay.now().obs;
  RxString userName = ''.obs;

  @override
  void onInit() {
    loadUsername();
    loadWeights();
    super.onInit();
  }

  Future<void> loadUsername() async {
    userName.value = await Helpers.getUsername() ?? '';
  }

  Future<void> loadWeights() async {
    var dbWeights = await DatabaseService().getAllWeights();
    weights.assignAll(dbWeights);
  }

  Future<void> deleteWeight(int id) async {
    await DatabaseService().deleteWeight(id);
    loadWeights();
  }

  Future<void> addOrUpdateWeight(WeightModel weight) async {
    WeightModel? existingWeight = await findWeightByDate(DateTime.now());

    if (existingWeight != null) {
      existingWeight.weight = weight.weight;
      existingWeight.date = DateTime.now().toString();
      await DatabaseService().deleteWeight(existingWeight.id);
      await DatabaseService().insertWeight(existingWeight);
      loadWeights();
    } else {
      await DatabaseService().insertWeight(weight);
      loadWeights();
    }
  }

  Future<WeightModel?> findWeightByDate(DateTime date) async {
    var allWeights = await DatabaseService().getAllWeights();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    // Find weight by matching date (ignoring time)
    return allWeights.firstWhere(
      (weight) => weight.date.split(' ')[0] == formattedDate,
    );
  }

  void setReminderTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  TimeOfDay getReminderTime() {
    return selectedTime.value;
  }
}
