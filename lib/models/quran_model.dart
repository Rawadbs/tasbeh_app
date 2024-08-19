class Surah {
  final String suraNameAr;
  final int suraNumber;

  Surah({required this.suraNameAr, required this.suraNumber});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      suraNameAr: json['sura_name_ar'],
      suraNumber: json['sura_no'],
    );
  }
}

class Aya {
  final int aya_no;
  final String ayaTextEmlaey;

  Aya({required this.aya_no, required this.ayaTextEmlaey});

  factory Aya.fromJson(Map<String, dynamic> json) {
    return Aya(
      aya_no: json['aya_no'],
      ayaTextEmlaey: json['aya_text'],
    );
  }
}
