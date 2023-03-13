import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/routes/route_name.dart';
import 'package:quran_app/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMagrin,
            vertical: 86,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Qur`an App',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Learn Quran and\nRecite once everyday',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: Color(0xffA19CC5),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 49,
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/splash_screen.png",
                    height: 450,
                    width: 314,
                  ),
                  Positioned(
                    bottom: -28,
                    child: SizedBox(
                      width: 185,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteName.home);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffF9B091),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Color(0xff091945),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
