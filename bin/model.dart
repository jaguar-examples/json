class AddInput {
  int a;

  int b;

  AddInput({this.a, this.b});

  static AddInput fromMap(Map map) => AddInput(a: map['a'], b: map['b']);
  Map toJson() => {'a': a, 'b': b};
}

class AllResults {
  int addition;
  int subtraction;
  AllResults({this.addition, this.subtraction});
  Map toJson() => {'addition': addition, 'subtraction': subtraction};
}
