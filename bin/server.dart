// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar/jaguar.dart';
import 'package:json/json.dart';

main() async {
  final server = Jaguar(port: 10000);
  server.getJson('/langs/:id',
      (ctx) => languages.firstWhere((b) => b.id == ctx.pathParams['id']));
  server.getJson('/langs', (_) => languages);
  server.postJson('/langs', (ctx) async {
    Language newLang = await ctx.bodyAsJson(convert: Language.fromMap);
    languages.add(newLang);
    return languages;
  });
  server.log.onRecord.listen(print);
  await server.serve(logRequests: true);
}
