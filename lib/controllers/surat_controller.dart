import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran_app/models/detail_sruat_model.dart';
import 'package:quran_app/providers/surat_provider.dart';

class SuratController extends GetxController with StateMixin<Map> {
  RxList<DetailSurat> detailSurat = RxList<DetailSurat>();
  // RxList<Surat> searchSurat = RxList<Surat>();

  // var isSearch = false.obs;
  // late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    // searchController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   searchController.dispose();
  // }

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

  // void changeSearch(bool isSearch) {
  //   this.isSearch.value = isSearch;
  //   searchSurat.value = surat;
  //   update();
  // }

  // void search(String query) {
  //   if (query.isNotEmpty) {
  //     searchSurat.value = surat.where((e) => e.name!.contains(query)).toList();
  //     update();
  //   }
  // }
}
