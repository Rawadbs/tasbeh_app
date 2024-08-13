
class Zekr {
  final String zekr;
  final int repeat;
  final String bless;

  Zekr({required this.zekr, required this.repeat, required this.bless});

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      zekr: json['zekr'],
      repeat: json['repeat'],
      bless: json['bless'],
    );
  }
}

class Athkar {
  final String title;
  final List<Zekr> content;

  Athkar({required this.title, required this.content});

  factory Athkar.fromJson(Map<String, dynamic> json) {
    var list = json['content'] as List;
    List<Zekr> zekrList = list.map((i) => Zekr.fromJson(i)).toList();

    return Athkar(
      title: json['title'],
      content: zekrList,
    );
  }
}

