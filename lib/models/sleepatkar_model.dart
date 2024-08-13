class SleepatkarModel {
  final String text; // عدلت الاسم ليتوافق مع JSON
  final int count; // عدلت الاسم ليتوافق مع JSON
 

  SleepatkarModel({
    required this.text,
    required this.count,

  });

  factory SleepatkarModel.fromJson(Map<String, dynamic> json) {
    return SleepatkarModel(
      text: json['text'],
      count: json['count'],

    );
  }
}
class SleepAthkar {
  final String category;
  final List<SleepatkarModel> array;

  SleepAthkar({required this.category, required this.array});

  factory SleepAthkar.fromJson(Map<String, dynamic> json) {
    var list = json['array'] as List;
    List<SleepatkarModel> arrayList = list.map((i) => SleepatkarModel.fromJson(i)).toList();

    return SleepAthkar(
      category: json['category'],
      array: arrayList,
    );
  }
}
