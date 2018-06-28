import 'dart:async';
import 'package:jaguar/jaguar.dart';

final languages = <Language>[
  Language(id: '1', name: 'Dart', isCompiled: false),
  Language(id: '2', name: 'Golang', isCompiled: true),
];

class Language {
  String id;

  String name;

  bool isCompiled;

  Language({this.id, this.name, this.isCompiled});

  static Language fromMap(Map<String, dynamic> map) =>
      Language(id: map['id'], name: map['name'], isCompiled: map['isCompiled']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'isCompiled': isCompiled};

  String toString() => toJson().toString();
}
