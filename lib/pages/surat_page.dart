import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quran_app/controllers/home_controller.dart';
import 'package:quran_app/controllers/surat_controller.dart';
import 'package:quran_app/models/surat_model.dart';
import 'package:quran_app/theme.dart';

class SuratPage extends GetView<SuratController> {
  SuratPage({super.key});
  final homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final surat = Get.arguments as Surat;
    controller.get(surat.numberOfSurah!);
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 35,
                bottom: 20,
                left: defaultMagrin,
                right: defaultMagrin,
              ),
              child: Column(
                children: [
                  appbar(surat),
                  const SizedBox(
                    height: 24,
                  ),
                  cardSurat(surat),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.get(surat.numberOfSurah!);
                },
                child: SingleChildScrollView(
                  child: controller.obx(
                    (_) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMagrin),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.detailSurat.length,
                        itemBuilder: (_, i) {
                          if (surat.name == "Al-Fatiha") {
                            return InkWell(
                              onLongPress: () {
                                Get.defaultDialog(
                                  title: "Terakhir Dibaca",
                                  content:
                                      const Text("Simpan Terakhir Dibaca?"),
                                  textConfirm: "OK",
                                  confirmTextColor: Colors.white,
                                  onConfirm: () async {
                                    var data = {
                                      "surat": surat.name,
                                      "ayat": controller.detailSurat[i].number,
                                      "index": i,
                                    };
                                    String jsonSurat = json.encode(data);
                                    controller.setLastRead(
                                        "last_read", jsonSurat);
                                    Get.back();
                                    homeC.getData();
                                  },
                                );
                              },
                              child: tileSurat(
                                controller.detailSurat[i].number,
                                controller.detailSurat[i].text,
                                controller.detailSurat[i].textId,
                              ),
                            );
                          } else {
                            if (i == 0) {
                              String substr =
                                  controller.detailSurat[i].text.substring(38);
                              return InkWell(
                                onLongPress: () {
                                  Get.defaultDialog(
                                    title: "Terakhir Dibaca",
                                    content:
                                        const Text("Simpan Terakhir Dibaca?"),
                                    textConfirm: "OK",
                                    confirmTextColor: Colors.white,
                                    onConfirm: () async {
                                      var data = {
                                        "surat": surat.name,
                                        "ayat":
                                            controller.detailSurat[i].number,
                                        "index": i,
                                      };
                                      String jsonSurat = json.encode(data);
                                      controller.setLastRead(
                                          "last_read", jsonSurat);
                                      Get.back();
                                      homeC.getData();
                                    },
                                  );
                                },
                                child: tileSurat(
                                  controller.detailSurat[i].number,
                                  substr,
                                  controller.detailSurat[i].textId,
                                ),
                              );
                            } else {
                              return InkWell(
                                onLongPress: () {
                                  Get.defaultDialog(
                                    title: "Terakhir Dibaca",
                                    content:
                                        const Text("Simpan Terakhir Dibaca?"),
                                    textConfirm: "OK",
                                    confirmTextColor: Colors.white,
                                    onConfirm: () async {
                                      var data = {
                                        "surat": surat.name,
                                        "ayat":
                                            controller.detailSurat[i].number,
                                        "index": i,
                                      };
                                      String jsonSurat = json.encode(data);
                                      controller.setLastRead(
                                          "last_read", jsonSurat);
                                      Get.back();
                                      homeC.getData();
                                    },
                                  );
                                },
                                child: tileSurat(
                                  controller.detailSurat[i].number,
                                  controller.detailSurat[i].text,
                                  controller.detailSurat[i].textId,
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
                    onLoading: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    onError: (error) => RefreshIndicator(
                      onRefresh: () async {
                        controller.get(surat.numberOfSurah!);
                      },
                      child: Center(
                        child: Text(
                          'Error: $error',
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox tileSurat(int number, String text, String textId) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 27,
                height: 27,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffA44AFF),
                ),
                child: Text(
                  "$number",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  text,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontFamily: "Amiri",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            textId,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              color: secondary,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(
            color: secondary,
            thickness: 1,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Container cardSurat(Surat surat) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 28,
        horizontal: 56,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/card_surat.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            surat.name!,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
          //  Text(
          //   "The Opening",
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w500,
          //     fontFamily: 'Poppins',
          //     color: Colors.white,
          //   ),
          // ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                surat.type!,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${surat.numberOfAyah} Ayat",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Image.asset(
            "assets/images/text_bismillah.png",
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Row appbar(Surat surat) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: secondary,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          surat.name!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        // Expanded(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Icon(
        //         Icons.search,
        //         size: 24,
        //         color: secondary,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
