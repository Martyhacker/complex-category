import 'dart:convert';

List<Entry> entryModelFromJson(String str) =>
    List<Entry>.from(json.decode(str).map((x) => Entry.fromJson(x)));

class Entry {
  int? id;
  String? name;
  List<Entry>? subcategories;
  Entry({this.id, this.name, this.subcategories});

  Entry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['subcategories'] != null) {
      subcategories = <Entry>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Entry.fromJson(v));
      });
    }
  }
}
