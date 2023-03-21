import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/models/surat_model.dart';
import 'package:quran_app/providers/surat_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<Map> {
  RxList<Surat> surat = RxList<Surat>();
  RxList<Surat> searchSurat = RxList<Surat>();
  RxInt selectedIndex = RxInt(-1);

  AudioPlayer audioPlayer = AudioPlayer();

  RxMap data = {}.obs;

  var isSearch = false.obs;
  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    change(null, status: RxStatus.empty());
    getData();
    get();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void stopAudio() async {
    await audioPlayer.stop();
    update();
  }

  Future<void> playAudio(Source source) async {
    await audioPlayer.play(source);
    update();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataJson = prefs.getString('last_read')!;
    var dataValue = json.decode(dataJson);
    data["data"] = dataValue;
    update();
  }

  void get() {
    try {
      change(null, status: RxStatus.loading());
      SuratProvider().getDataSurat().then((response) {
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

  void changeSearch(bool isSearch) {
    this.isSearch.value = isSearch;
    searchSurat.value = surat;
    update();
  }

  void search(String query) {
    if (query.isNotEmpty) {
      searchSurat.value = surat.where((e) => e.name!.contains(query)).toList();
      update();
    }
  }
}
