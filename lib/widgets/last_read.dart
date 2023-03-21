import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/controllers/home_controller.dart';

class LastRead extends StatelessWidget {
  LastRead({Key? key}) : super(key: key);
  final data = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
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
            Obx(
              () => Text(
                data.data.isEmpty ? "" : data.data["data"]["surat"],
                style: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Obx(
              () => Text(
                data.data.isEmpty ? "" : "Ayat : ${data.data["data"]["ayat"]}",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
