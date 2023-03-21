import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_app/models/detail_sruat_model.dart';
import 'package:quran_app/providers/surat_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuratController extends GetxController with StateMixin<Map> {
  RxList<DetailSurat> detailSurat = RxList<DetailSurat>();

  SharedPreferences? _prefs;

  @override
  void onInit() {
    super.onInit();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setLastRead(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

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
