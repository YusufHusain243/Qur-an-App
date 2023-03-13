import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/controllers/home_controller.dart';
import 'package:quran_app/theme.dart';

class Appbar extends StatelessWidget {
  Appbar({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.isSearch.value == false) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleAppbar(),
            InkWell(
              onTap: () {
                homeController.changeSearch(true);
                homeController.searchController.clear();
              },
              child: Icon(
                Icons.search,
                color: secondary,
              ),
            )
          ],
        );
      } else {
        return search();
      }
    });
  }

  Widget search() {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: (value) {
          return homeController.search(value);
        },
        controller: homeController.searchController,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          hintText: 'Search...',
          hintStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          suffixIcon: IconButton(
            onPressed: () {
              homeController.changeSearch(false);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: secondary,
        ),
      ),
    );
  }

  Text titleAppbar() {
    return const Text(
      'Qur`an App',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: Colors.white,
      ),
    );
  }
}
