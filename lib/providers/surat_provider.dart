import 'package:get/get.dart';

class SuratProvider extends GetConnect {
  final url =
      "https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json";

  Future<Response> getData() => get(url);
}
