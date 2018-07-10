// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar/jaguar.dart';
import 'model.dart';

main() async {
  final server = Jaguar(port: 10000);

  // Addition
  server.post('/addition', (Context ctx) async {
    AddInput input = await ctx.bodyAsJson(convert: AddInput.fromMap);
    return input.a + input.b;
  });

  // Addition
  server.postJson('/all', (Context ctx) async {
    AddInput inp = await ctx.bodyAsJson(convert: AddInput.fromMap);
    return AllResults(addition: inp.a + inp.b, subtraction: inp.a - inp.b);
  });

  server.log.onRecord.listen(print);
  await server.serve(logRequests: true);
}
