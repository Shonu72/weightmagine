import 'package:get/get.dart';
import 'package:weightmagine/src/controllers/weight_controller.dart';

class DependencyInjection {
  static void inject() {
    _injectController();
  }

  static void _injectController() {
    Get.lazyPut(() => WeightController());
  }
}
