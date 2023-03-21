import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/controllers/home_controller.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/widgets/appbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quran_app/widgets/last_read.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 35,
                bottom: 10,
                left: defaultMagrin,
                right: defaultMagrin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appbar(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Assalamualaikum",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: secondary,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // const Text(
                  //   "Yusuf Husain",
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontFamily: "Poppins",
                  //     fontWeight: FontWeight.w600,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 28,
                  ),
                  InkWell(
                    onTap: () {
                      controller.getData();
                    },
                    child: LastRead(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.get();
                },
                child: SingleChildScrollView(
                  child: controller.obx(
                    (_) {
                      if (controller.isSearch.value == false) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMagrin),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.surat.length,
                          itemBuilder: (_, i) => InkWell(
                            onTap: () {
                              Get.toNamed(
                                RouteName.surat,
                                arguments: controller.surat[i],
                              );
                            },
                            child: tileSurat(
                              i,
                              controller.surat[i].numberOfSurah!,
                              controller.surat[i].numberOfAyah!,
                              controller.surat[i].name!,
                              controller.surat[i].type!,
                              controller.surat[i].audioUrl!,
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMagrin),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchSurat.length,
                          itemBuilder: (_, i) {
                            int idx = controller.surat.indexWhere((e) =>
                                e.name == controller.searchSurat[i].name);
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  RouteName.surat,
                                  arguments: controller.searchSurat[i],
                                );
                              },
                              child: tileSurat(
                                idx,
                                controller.searchSurat[i].numberOfSurah!,
                                controller.searchSurat[i].numberOfAyah!,
                                controller.searchSurat[i].name!,
                                controller.searchSurat[i].type!,
                                controller.searchSurat[i].audioUrl!,
                              ),
                            );
                          },
                        );
                      }
                    },
                    onLoading: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    onError: (error) => Center(
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
          ],
        ),
      ),
    );
  }

  SizedBox tileSurat(
    int i,
    int numberOfSurah,
    int numberOfAyat,
    String name,
    String type,
    String url,
  ) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              i == controller.selectedIndex.value
                  ? controller.audioPlayer.state == PlayerState.playing
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white,
                          size: 36,
                        )
                      : Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/icon_ayat.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            numberOfSurah.toString(),
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        )
                  : Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/icon_ayat.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        numberOfSurah.toString(),
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        type.toString(),
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$numberOfAyat Ayat",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.selectedIndex.value = i;
                        controller.audioPlayer.state == PlayerState.playing
                            ? controller.stopAudio()
                            : controller.playAudio(UrlSource(url.toString()));
                      },
                      icon: i == controller.selectedIndex.value
                          ? controller.audioPlayer.state == PlayerState.playing
                              ? const Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )
                          : const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(
            color: secondary,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
