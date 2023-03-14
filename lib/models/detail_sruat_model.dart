class DetailSurat {
  int number;
  String text;
  String textId;

  DetailSurat({
    required this.number,
    required this.text,
    required this.textId,
  });

  factory DetailSurat.fromJson(Map<String, dynamic> json) {
    return DetailSurat(
      number: json['number'],
      text: json['text'],
      textId: json['translation_id'],
    );
  }
}
