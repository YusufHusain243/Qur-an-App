class Surat {
  int? numberOfSurah;
  int? numberOfAyah;
  String? name;
  String? type;

  Surat({
    this.numberOfSurah,
    this.numberOfAyah,
    this.name,
    this.type,
  });

  factory Surat.fromJson(Map<String, dynamic> json) {
    return Surat(
      numberOfSurah: json['number_of_surah'],
      numberOfAyah: json['number_of_ayah'],
      name: json['name'],
      type: json['type'],
    );
  }
}
