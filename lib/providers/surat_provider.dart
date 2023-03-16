import 'package:get/get.dart';

class SuratProvider extends GetConnect {
  final urlSurat =
      "https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json";

  Future<Response> getDataSurat() => get(urlSurat);

  Future<Response> getDataDetailSurat(int number) => get(
      "https://raw.githubusercontent.com/penggguna/QuranJSON/master/surah/$number.json");
}
