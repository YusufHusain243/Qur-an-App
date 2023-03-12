import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_app/models/surat_model.dart';
import 'package:quran_app/providers/surat_provider.dart';

class HomeController extends GetxController with StateMixin<Map> {
  RxList<Surat> surat = RxList<Surat>();

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    get();
    super.onInit();
  }

  void get() {
    try {
      change(null, status: RxStatus.loading());
      SuratProvider().getData().then((response) {
        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          surat.value =
              jsonResponse.map((surat) => Surat.fromJson(surat)).toList();
          change(null, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error());
          return null;
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error());
      return;
    }
  }
}
