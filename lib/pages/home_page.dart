import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/controllers/home_controller.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/widgets/appbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        body: RefreshIndicator(
          onRefresh: () async {
            controller.get();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 35,
                horizontal: defaultMagrin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Appbar(),
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
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Yusuf Husain",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  lastRead(),
                  const SizedBox(
                    height: 28,
                  ),
                  controller.obx(
                    (_) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.surat.length,
                        itemBuilder: (_, i) => tileSurat(
                          i + 1,
                          controller.surat[i].numberOfSurah!,
                          controller.surat[i].numberOfAyah!,
                          controller.surat[i].name!,
                          controller.surat[i].type!,
                        ),
                      );
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox tileSurat(
    int index,
    int numberOfSurah,
    int numberOfAyat,
    String name,
    String type,
  ) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                    name,
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
                        type,
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
                      onPressed: () {},
                      icon: const Icon(
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
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Container lastRead() {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/last_read.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/icon_book.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Last Read",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Al-Fatihah",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Ayat No : 1",
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
