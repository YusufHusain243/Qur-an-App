import 'package:get/get.dart';
import 'package:quran_app/controllers/surat_controller.dart';

class SuratBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SuratController());
  }
}
