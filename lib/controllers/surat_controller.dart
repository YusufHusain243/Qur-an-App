import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_app/models/detail_sruat_model.dart';
import 'package:quran_app/providers/surat_provider.dart';

class SuratController extends GetxController with StateMixin<Map> {
  RxList<DetailSurat> detailSurat = RxList<DetailSurat>();

  void get(int number) {
    try {
      change(null, status: RxStatus.loading());
      SuratProvider().getDataDetailSurat(number).then((response) {
        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          jsonResponse = jsonResponse['verses'];
          for (var r in jsonResponse) {
            detailSurat.add(DetailSurat.fromJson(r));
          }
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
