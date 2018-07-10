library main;

import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jaguar_resty/jaguar_resty.dart';

import 'model.dart';

const base = 'http://localhost:10000';

main() async {
  globalClient = http.IOClient();

  print(await post('$base/addition').json(AddInput(a: 10, b: 15)).one());
  print(await post('$base/all').json(AddInput(a: 15, b: 10)).one());

  exit(0);
}
