library main;

import 'dart:io';
import 'dart:async';

import 'package:http/http.dart' as http;

const String kHostname = 'localhost';

const int kPort = 10001;

final http.Client _client = new http.Client();

Future<Null> printHttpClientResponse(http.Response resp) async {
  print('=========================');
  print("body:");
  print(resp.body);
  print('=========================');
}

Future<Null> all() async {
  http.Response resp = await _client.get("http://$kHostname:$kPort/api/book");
  await printHttpClientResponse(resp);
}

Future<Null> add() async {
  http.Response resp = await _client.post("http://$kHostname:$kPort/api/book",
      body:
          '{"id":"3","name":"Da vinci code","author":"Dan Brown","price":120.0}');
  await printHttpClientResponse(resp);
}

Future<Null> delete() async {
  http.Response resp =
      await _client.delete("http://$kHostname:$kPort/api/book/3");
  await printHttpClientResponse(resp);
}

main() async {
  await all();
  await add();
  await delete();
  exit(0);
}
